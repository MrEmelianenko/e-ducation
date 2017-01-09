class CreateConversationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_users do |t|
      t.belongs_to :conversation
      t.belongs_to :user

      t.timestamps
    end
  end
end
