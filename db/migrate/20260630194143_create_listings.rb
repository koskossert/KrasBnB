class CreateListings < ActiveRecord::Migration[8.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.string :author

      t.timestamps
    end
  end
end
