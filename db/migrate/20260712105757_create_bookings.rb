class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :first
      t.datetime :second
      t.timestamps
    end
  end
end
