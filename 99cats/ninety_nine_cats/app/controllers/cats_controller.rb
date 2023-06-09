class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def create
        cat = Cat.new(cat_params)
        if cat.save
            render json: cat
        else
            render json: cat.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        cat = Cat.find_by(id: params[:id])
        if cat.update(cat_params)
            redirect_to cat_url(cat.id)
        else
            render json: cat.errors.full_messages, status: :unprocessable_entity
        end
    end

    def new
        render :new
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    private

    def cat_params
        params.require(:cat).permit(:name,:sex,:birth_date,:color,:description)
    end
    
end