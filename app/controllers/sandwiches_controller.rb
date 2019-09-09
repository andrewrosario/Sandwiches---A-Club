class SandwichesController < ApplicationController

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

    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:title, :instructions, :description, :img_url)
    end
end
