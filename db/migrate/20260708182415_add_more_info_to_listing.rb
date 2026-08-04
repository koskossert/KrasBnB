class AddMoreInfoToListing < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :description, :string
    add_column :listings, :rating, :float
    add_column :listings, :country, :string
  end
end
