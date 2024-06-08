class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|

      t.references :user, null: false
      t.references :image, polymorphic: true
      t.text :title
      t.timestamps
    end
  end
end
