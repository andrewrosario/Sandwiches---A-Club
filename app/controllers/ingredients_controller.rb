class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
    before_action :set_type_of, only: [:new, :create]
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
        if SandwichIngredient.find_by(ingredient_id: @ingredient.id)
            flash[:message] = "You can't delete an ingredient that's in use in a sandwich."
            return redirect_to @ingredient
        else
            @ingredient.destroy
            return redirect_to ingredients_path
        end
    end

    private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
    
    def set_type_of
      @categories = [['bread', 'bread'], ['filling', 'filling'], ['condiment', 'condiment']]
    end
end
