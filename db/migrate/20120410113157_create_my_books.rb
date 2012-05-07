class CreateMyBooks < ActiveRecord::Migration
  def change
    create_table :my_books do |t|   
	  t.integer :book_id
	  t.integer :user_id
	  t.float   :height
	  t.float   :width
	  t.float   :weight
	  t.string  :additional_information
	  t.string  :photos
	  
      t.timestamps
    end
  end
end
