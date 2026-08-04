class CreateParameters < ActiveRecord::Migration[8.1]
  def change
    create_table :parameters do |t|
      t.string :name
    end
  end
end
