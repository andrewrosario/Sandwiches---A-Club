class SandwichesController < ApplicationController
    CATEGORIES = ['All', 'Vegan', 'Vegetarian', 'Gluten-Free']
    
    def index
        @sandwiches = Sandwich.all.sort_by{|s| s.title}
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
        if !sandwich.errors.full_messages.empty?
            flash[:error] = sandwich.errors.full_messages[0]
            return redirect_to new_sandwich_path
        end
        redirect_to edit_sandwich_path(sandwich)
    end

    def show
        @sandwich = Sandwich.find(params[:id])
        
    end

    def edit
        @sandwich = Sandwich.find(params[:id])
        @ingredients = Ingredient.all
        @ingredient = Ingredient.new
        @type_of = ['Bread', 'Condiment', 'Filling']
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
        @sandwiches = (sandwiches_by_category & sandwiches_by_search).sort_by{|s| s.title}
        render 'index'
    end

    def add_ingredient
        ingredient = Ingredient.create(ingredient_params)
        sandwich_ingredient = SandwichIngredient.create(sandwich_id: params[:ingredient][:sandwich_id], ingredient_id: ingredient.id, quantity: params[:ingredient][:quantity])
        sandwich = Sandwich.find(params[:ingredient][:sandwich_id])
        if !ingredient.errors.full_messages.empty?
            # byebug
            flash[:error] = ingredient.errors.full_messages[0]
            return edit_sandwich_path(sandwich)
        end
        redirect_to edit_sandwich_path(sandwich)
    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:title, :instructions, :description, :img_url, :ingredients, :sandwich_photo)
    end
end
