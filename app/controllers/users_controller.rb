class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :must_be_logged_in, only: [:show, :edit, :update, :destroy, :home]
    def index
      @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.username)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @user.destroy
        redirect_to stranger_home_path
    end

    def home
        @user = current_user
        @sandwich = Sandwich.all.sample
    end

    private

    def set_user
        @user = User.find_by!(username: params[:username])
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :display_name, :age, :bio, :img_url, :email, :avatar)
    end
end
