class Api::V1::GoalsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :update, :destroy]
    def index
        @goals = Goal.all 
        render json: @goals
    end

    def show
        goal = Goal.find(params[:id])
        render json: goal
    end

    def destroy
        goal = Goal.find(params[:id])
        if goal
        goal.destroy
            render json: { message: 'goal deleted' }, status: 200
        else
            render json: { error: 'unable to delete goal' }, status: 400
        end
      end

    def create 
        @goal = Goal.create(goal_params)
        # byebug        
        render json: @goal
    end

private 

    def goal_params
        params.require(:goal).permit(:user_id, :daily_calories, :rate_of_loss, :weight_goal)
    end 

end
