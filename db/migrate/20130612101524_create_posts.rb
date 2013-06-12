class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |p|
  		p.string :title
  		p.string :link_url
  		p.integer :user_id
  	end
  end
end
