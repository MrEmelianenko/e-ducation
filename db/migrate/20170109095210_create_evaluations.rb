class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.belongs_to :from_user
      t.belongs_to :to_user
      t.belongs_to :subject
      t.belongs_to :schedule

      t.integer :value
      t.string :comment

      t.timestamps
    end
  end
end
