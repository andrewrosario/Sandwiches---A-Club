class StaticController < ApplicationController
    def home
        if logged_in
            redirect_to home_path
        else
            render :home
        end
    end
    def about
    end
    def forbidden
    end
end