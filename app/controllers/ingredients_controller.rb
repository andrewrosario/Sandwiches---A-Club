class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
    before_action :set_type_of, only: [:new, :create]
    before_action :must_be_logged_in, only: [:new, :edit, :destroy]
    def index
        @ingredients = Ingredient.all.sort_by{|i| i.name}
        @categories = ['All', 'Filling', 'Bread', 'Condiment']
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
        @categories = %w(bread filling condiment) 
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
        @categories = %w(bread filling condiment) 
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

    def search
        @categories = ['All', 'Filling', 'Bread', 'Condiment']
        ingredients_by_search = Ingredient.name_search(params[:search][:name])
        ingredients_by_category = Ingredient.restrict_by_category(params[:category])
        @ingredients = (ingredients_by_category & ingredients_by_search).sort_by{|i| i.name}
        render 'index'
    end

    private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
    
    def set_type_of
      @categories = [['bread', 'bread'], ['filling', 'filling'], ['condiment', 'condiment']]
    end
end
