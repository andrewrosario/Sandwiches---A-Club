class ApplicationController < ActionController::Base
    def ingredient_params
        params.require(:ingredient).permit(:name, :type_of, :img_url,
        :is_meat, :is_dairy_or_egg, :is_gluten_free, :ingredient_photo)
    end

    def current_user 
      (User.find_by_id(session[:user_id]) || User.new)
    end

    def logged_in
      current_user.id != nil
    end

    def must_be_logged_in
      return redirect_to forbidden_path unless logged_in
    end
end
