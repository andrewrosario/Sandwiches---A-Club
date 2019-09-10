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

    end

    def show
        @sandwich = Sandwich.find(params[:id])
        
    end

    def edit
        @sandwich = Sandwich.find(params[:id])
        @type_of = ['Bread', 'Meat', 'Filling']
        @categories = CATEGORIES
    end

    def update
        # {"sandwich"=>{"title"=>"?", "description"=>"?", "ingredient_ids"=>["", "1", "2", "3", "4"], "instructions"=>"?"}
        byebug
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

    private

    def sandwich_params
        params.require(:sandwich).permit(:title, :instructions, :description, :img_url)
    end
end
