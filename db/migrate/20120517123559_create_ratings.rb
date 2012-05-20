class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :evaluator_id
      t.integer :rated_user_id
      t.boolean :vote
      
      t.timestamps
    end
    
    add_index :ratings, [:evaluator_id, :rated_user_id], :unique => true
  end
end
