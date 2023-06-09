class CatsController < ApplicationController

    def index
        cats = Cat.all
        render json: cats
    end

    def show
        cat = Cat.find_by(id: params[:id])
        render json: cat
    end

    def create
        cat = Cat.new
    end

    def update
    end

    def new
    end

    def edit
    end

    private

    def cat_params

    end
    
end