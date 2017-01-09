class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation
      t.belongs_to :user

      t.string :text

      t.timestamps
    end
  end
end
