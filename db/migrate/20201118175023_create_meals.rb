class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :date
      # t.string :meal_type
      # t.json :breakfast
      # t.json :lunch
      # t.json :dinner
      # t.json :snacks
      t.timestamps
    end
  end
end
