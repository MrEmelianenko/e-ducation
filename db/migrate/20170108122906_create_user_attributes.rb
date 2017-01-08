class CreateUserAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_attributes do |t|
      t.belongs_to :user

      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
