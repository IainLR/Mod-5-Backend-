class Api::V1::MealPlansController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :update]

    def index
        meal_plans = MealPlan.all 
        render json: meal_plans, include: [:user, :meal]
    end 

    def create 
        @meal_plan = MealPlan.create(mp_params)
        # byebug        
        render json: @meal_plan
    end

private 

    def mp_params
        params.require(:meal_plan).permit(:user_id, :meal_id)
    end 
end
