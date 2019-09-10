class SandwichesController < ApplicationController

    def index
        @sandwiches = Sandwich.all
        @categories = ['All', 'Vegan', 'Vegetarian', 'Gluten-Free', "Halal", "Kosher"]
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
    end

    def update

    end

    def destroy

    end

    def search
        @categories = ['All', 'Vegan', 'Vegetarian', 'Gluten-Free', "Halal", "Kosher"]
        @sandwiches = Sandwich.restrict_by_category(params[:category])
        if !params[:search][:name].empty?
            @sandwiches = @sandwiches
        end
        render 'index'
    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:title, :instructions, :description, :img_url)
    end
end
