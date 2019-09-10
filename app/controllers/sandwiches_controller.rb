class SandwichesController < ApplicationController
    CATEGORIES = ['All', 'Vegan', 'Vegetarian', 'Gluten-Free', "Halal", "Kosher"]
    
    def index
        @sandwiches = Sandwich.all
        @categories = CATEGORIES
    end

    def new
        @sandwich = Sandwich.new
    end

    def create
        sandwich = Sandwich.new(sandwich_params)
        user = User.find(params[:sandwich][:user_id])
        sandwich.user = user
        sandwich.save
        redirect_to edit_sandwich_path(sandwich)
    end

    def show
        @sandwich = Sandwich.find(params[:id])
        
    end

    def edit
        @sandwich = Sandwich.find(params[:id])
        @ingredients = Ingredient.all
        @ingredient = Ingredient.new
        @type_of = ['Bread', 'Meat', 'Filling']
        @categories = CATEGORIES
    end

    def update
        sandwich = Sandwich.find(params[:id])
        sandwich.ingredients.clear
        ingredients = params[:sandwich][:ingredients]
        ingredients.each do |ing|
            thing = Ingredient.find_by(name: ing)
            quantity = params[:sandwich][:quantity][ing]
            sandwich_ingredient = SandwichIngredient.create(sandwich_id: sandwich.id, ingredient_id: thing.id, quantity: quantity)
        end
        redirect_to sandwich_path(sandwich)
    end

    def destroy
        @sandwich = Sandwich.find(params[:id])
        @sandwich.destroy
        redirect_to '/sandwiches'
    end

    def search
        @categories = CATEGORIES
        sandwiches_by_search = Sandwich.consolidate_searches(params[:search][:name])
        sandwiches_by_category = Sandwich.restrict_by_category(params[:category])
        @sandwiches = sandwiches_by_category & sandwiches_by_search
        render 'index'
    end

    def add_ingredient
        ingredient = Ingredient.create(ingredient_params)
        sandwich_ingredient = SandwichIngredient.create(sandwich_id: params[:ingredient][:sandwich_id], ingredient_id: ingredient.id, quantity: params[:ingredient][:quantity])
        sandwich = Sandwich.find(params[:ingredient][:sandwich_id])
        byebug
        redirect_to edit_sandwich_path(sandwich)
    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:title, :instructions, :description, :img_url, :ingredients)
    end
end
