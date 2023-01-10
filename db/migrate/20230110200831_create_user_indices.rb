class CreateUserIndices < ActiveRecord::Migration[6.0]
  def change
    create_table :user_indices do |t|

      t.timestamps
    end
  end
end
