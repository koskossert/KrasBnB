class CreateCharacteristics < ActiveRecord::Migration[8.1]
  def change
    create_table :characteristics do |t|
      t.references :listing, foreign_key: true
      t.references :parameter, foreign_key: true
    end
  end
end
