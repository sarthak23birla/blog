class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :article, foreign_key: true, index: true
      t.belongs_to :commentor, index: true

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :commentor_id
  end
end
