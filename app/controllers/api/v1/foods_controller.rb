class Api::V1::FoodsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :update, :destroy]

    def index
        @foods = Food.all 
        render json: @foods
    end

    def show
        food = Food.find(params[:id])
        render json: food
    end

    def destroy
        food = Food.find(params[:id])
        if food
        food.destroy
            render json: { message: 'food deleted' }, status: 200
        else
            render json: { error: 'unable to delete food' }, status: 400
        end
      end

    def create 
        @food = Food.create(food_params)
        # byebug        
        render json: @food
    end

private 

    def food_params
        params.require(:food).permit(:calories, :name, :blds, :meal_id)
    end 

end
