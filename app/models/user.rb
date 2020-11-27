class User < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: { case_sensitive: false }
    validates :email, uniqueness: { case_sensitive: false }
    # has_many :days
    # has_many :meals, through: :days
    has_many :meal_plans
    has_many :meals, through: :meal_plans
    has_one :goal
end
