class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :weight_goal
      t.integer :rate_of_loss
      t.integer :daily_calories

      t.timestamps
    end
  end
end
