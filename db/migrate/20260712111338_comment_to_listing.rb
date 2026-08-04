class CommentToListing < ActiveRecord::Migration[8.1]
  def change
    add_reference :comments, :listing, foreign_key: true
  end
end
