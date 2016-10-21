class CreateListings < ActiveRecord::Migration
  def change
      create_table :listings do |t|
      t.string :title
      t.string :ebay
      t.string :amazon
      t.string :link3
      t.string :link4
      t.integer :zip
      t.integer :user_id, :null => false
      t.integer :category_id, :null => false
      end
  end
end
