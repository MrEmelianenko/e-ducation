class CreateUserRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_relations do |t|
      t.belongs_to :user
      t.belongs_to :to_user

      t.integer :relation_type, default: 0

      t.timestamps
    end
  end
end
