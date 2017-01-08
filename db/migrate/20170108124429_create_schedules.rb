class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :subject
      t.belongs_to :grade
      t.belongs_to :user

      t.string :name
      t.string :description
      t.string :requirements

      t.datetime :start_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
