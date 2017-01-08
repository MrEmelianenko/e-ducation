class CreateSubjectUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_users do |t|
      t.belongs_to :subject
      t.belongs_to :user
      t.integer    :relation_type, default: 0
    end
  end
end
