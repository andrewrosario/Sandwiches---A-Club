class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :sandwiches]
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
            redirect_to home_path
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @user.is_deleted = true
        @user.save
        redirect_to logout_path
    end

    def home
        @user = current_user
        @sandwich = Sandwich.all.sample
        user_sandwiches_by_rating = @user.sandwiches.sort_by{|sandwich| sandwich.average_rating}
        @top_sandwich = user_sandwiches_by_rating.last
        @bottom_sandwich = user_sandwiches_by_rating.first
    end

    def sandwiches
        @sandwiches = @user.sandwiches
    end

    def stats
        @hall_of_fame = User.sort_by_rating.reverse.slice(0, 5)
        @hall_of_shame = User.sort_by_rating.slice(0, 5)
        @highest_rated = Sandwich.highest_rated
        @most_commented = Sandwich.most_commented

    end

    private

    def set_user
        @user = User.find_by!(username: params[:username])
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :display_name, :age, :bio, :img_url, :email, :avatar)
    end
end
