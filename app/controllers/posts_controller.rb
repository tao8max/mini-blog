class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post=Post.new params[:post]
		@post.user_id = current_user.id
		@post.username = current_user.username
		if @post.save
			redirect_to "/user_posts"
			# redirect_to post_path(session[:user_id])
			else 
			flash[:alert] = "Something went wrong. Please enter your post again."
			redirect_to "/user_posts"
		end
	end

	def destroy
		@post=Post.find(params[:id]).destroy
		redirect_to "/user_posts"
	end

	def show
		@post = Post.find params[:id]
		@comment = Comment.new
		@comments = @post.comments
	end

	def edit
		@post = Post.find params[:id]
	end

	def update
		@post=Post.find params[:id]
		@post.update_attributes params[:post]
		redirect_to post_path(@post.id)
	end

	def user_posts
		@post = Post.new
		@posts = Post.where(user_id: current_user.id)
	end

end
