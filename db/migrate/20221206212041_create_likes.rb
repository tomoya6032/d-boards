class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false
      t.references :article, null: false
      # t.references :chat, null: false
      # t.references :information, null: false
      # t.references :comment, null: false
      t.timestamps
    end
  end
end
