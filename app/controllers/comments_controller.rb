class CommentsController < ApplicationController

	

	def create

		@comment=Comment.new params[:comment]
		@comment.user_id=current_user.id
		@comment.username=current_user.username
		@comment.post_id=params[:comment][:post_id]
		if @comment.save
			redirect_to post_path(@comment.post_id)
		else
			flash[:alert] = "Something went wrong. Please enter your post again."
			redirect_to post_path(@post.id)
		end
	end

	
end
