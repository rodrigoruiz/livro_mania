class CreateMissingBookNotifications < ActiveRecord::Migration
  def change
    create_table :missing_book_notifications do |t|
      t.integer :user_id
      t.integer :book_id
      
      t.timestamps
    end
  end
end
