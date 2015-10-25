class UsersController < ApplicationController
	def current_user
		if session[:user_id]
			@current_user=User.find(session[:user_id])
		end
	end

	def new
		@user = User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			redirect_to "/login_form"
	    else
	    	render :new
	    end
	end

	def show
		@user=User.find params[:id]
	end


	def login_form
		@user = User.new
	end

	def login
		@user=User.where(email: params[:user][:email]).first
		if @user && @user.password == params[:user][:password]
			session[:user_id]=@user.id
			redirect_to posts_path
		else
			flash[:alert]="Wrong email and/or password"
			redirect_to "/login_form"
		end
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		@user.update_attributes params[:user]
		flash[:info]="Your profile has been changed!"
		redirect_to edit_user_path
	end

	def logout
		if session[:user_id]
			session[:user_id]=nil
			redirect_to home_path
		else
			redirect_to home_path
		end
	end

	def index
		@users=User.all
	end

	def destroy
		@user = User.find params[:id]
    	@user.destroy
    	session[:user_id]=nil
    	redirect_to users_path
	end

	private

    def user_params
    	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  	end
end
