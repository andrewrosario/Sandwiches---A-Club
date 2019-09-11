class ApplicationController < ActionController::Base
    def ingredient_params
        params.require(:ingredient).permit(:name, :type_of, :img_url,
        :is_meat, :is_dairy_or_egg, :is_gluten_free, :ingredient_photo)
    end

    def current_user 
      (User.find(session[:user_id]) || User.new)
    end
end
