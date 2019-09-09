class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
    def index
        @ingredients = Ingredient.all
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @ingredient.update(ingredient_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy
        @ingredient.destroy
        redirect_to ingredients_path
    end

    private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name, :type_of, :img_url,
        :is_meat, :is_dairy_or_egg, :is_gluten_free)
    end
end
