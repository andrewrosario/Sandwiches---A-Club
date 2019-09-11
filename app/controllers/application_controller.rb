class ApplicationController < ActionController::Base
    def ingredient_params
        params.require(:ingredient).permit(:name, :type_of, :img_url,
        :is_meat, :is_dairy_or_egg, :is_gluten_free)
    end

    def current_user 
      (User.find_by(session[:user_id]) || User.new)
    end
end
