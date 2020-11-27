class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.integer :calories 
      t.string :name
      t.string :blds
      t.belongs_to :meal
      t.timestamps
    end
  end
end
