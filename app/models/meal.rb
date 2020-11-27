class Meal < ApplicationRecord
    # has_many :days
    # has_many :users, through: :users
    has_many :meal_plans
    has_many :users, through: :meal_plans
    has_many :foods
end
