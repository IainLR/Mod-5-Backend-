class Api::V1::MealsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :update]

    def index
        @meals = Meal.all 
        render json: @meals, include: [:foods]
    end

    def show
        meal = Meal.find(params[:id])
        render json: meal, include: [:foods]
    end

    def update
        # byebug
        if @meal.update(meal_params)
            render json: @meal
          else
            render nothing: true, status: :unprocessable_entity
          end
    end

    def create 
        @meal = Meal.create(meal_params)
        # byebug 
        render json: @meal

        # if @user.valid?
        #     @token = encode_token({ user_id: @user.id })
        #     render json: { user: UserSerializer.new(@user) }, status: :created
        # else 
        #     render json: { error: 'failed to create user' }, status: :not_acceptable
        # end 
    end

    private

    def meal_params
        params.require(:meal).permit(:date)
    end

    
    
end
