class UsersController < ApplicationController
    
    def index
        @users = User.all
        # binding.pry
    end
    
    def new 
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
            flash[:success] = "Register success"
            redirect_to users_path
        else
            falsh[:success] = "Register failed"
            render :new
        end
    end

    def show    
        @user = User.find_by id: params[:id]
    end

    private
    def user_params
        params.require(:user).permit :username, :password, :password_confirmation, :email
    end
end

