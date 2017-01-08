class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.string :description

      t.integer :graduation_year

      t.timestamps
    end
  end
end
