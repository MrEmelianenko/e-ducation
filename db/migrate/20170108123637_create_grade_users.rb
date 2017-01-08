class CreateGradeUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :grade_users do |t|
      t.belongs_to :grade
      t.belongs_to :user
      t.integer    :relation_type, default: 0
    end
  end
end
