class SessionsController < ApplicationController
    def new
    end
    def create
      user = User.find_by(username: params[:user][:username])
      if user.is_deleted?
        flash[:message] = "This user has been deleted."
        return redirect_to login_path
      end
      authenticated = user.try(:authenticate, params[:user][:password])
      unless authenticated
        flash[:message] = "Incorrect username or password."
        return redirect_to login_path
      end
      session[:user_id] = authenticated.id
      @user = authenticated
      redirect_to home_path
    end

    def destroy
      session.delete :user_id
      redirect_to stranger_home_path
    end
end
