class AddCityTolisting < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :city, :string, default: "Красноярск"
  end
end
