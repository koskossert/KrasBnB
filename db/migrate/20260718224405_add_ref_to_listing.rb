class AddRefToListing < ActiveRecord::Migration[8.1]
  def change
    remove_column :listings, :author, :string

    add_reference :listings, :user, foreign_key: true
  end
end
