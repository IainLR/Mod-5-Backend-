class CreateMealPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plans do |t|
      t.belongs_to :user
      t.belongs_to :meal
      t.timestamps
    end
  end
end
