class CreateMyBooks < ActiveRecord::Migration
  def change
    create_table :my_books do |t|   
  	  t.integer :book_id
  	  t.integer :user_id
  	  t.float   :weight
  	  t.string  :additional_information
  	  t.has_attached_file :photo
	    
      t.timestamps
    end
  end
end
