class CreateListings < ActiveRecord::Migration
  def change
      create_table :listings do |t|
      t.string :title
      t.string :address
      t.string :website
      t.string :phone
      t.integer :user_id, :null => false
      t.integer :category_id, :null => false
      end
  end
end
