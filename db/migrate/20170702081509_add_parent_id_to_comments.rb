class AddParentIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :comment, index: true
    add_foreign_key :comments, :comments, column: :comment_id
  end
end
