class AddRefUser < ActiveRecord::Migration[8.1]
  def change
    remove_column :comments, :user_id, :int

    add_reference :comments, :user, foreign_key: true
  end
end
