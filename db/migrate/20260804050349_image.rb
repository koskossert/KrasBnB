class Image < ActiveRecord::Migration[8.1]
  def change
    create_table :images do |t|
      t.references :listing, foreign_key: true
      t.string :path
    end
  end
end
