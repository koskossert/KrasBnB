class AddPeople < ActiveRecord::Migration[8.1]
  def change
    add_column :listings, :people, :integer
  end
end
