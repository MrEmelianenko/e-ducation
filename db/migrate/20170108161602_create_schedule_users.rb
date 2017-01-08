class CreateScheduleUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_users do |t|
      t.belongs_to :schedule
      t.belongs_to :user

      t.integer :status,     default: 0
      t.integer :evaluation, default: nil

      t.timestamps
    end
  end
end
