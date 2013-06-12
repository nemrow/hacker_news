class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |c|
  		c.string :text
  		c.integer :user_id
  		c.integer :post_id
  		c.timestamps
  	end
  end
end
