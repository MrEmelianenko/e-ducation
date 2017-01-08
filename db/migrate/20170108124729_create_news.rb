class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.belongs_to :user

      t.string  :title
      t.text    :body
      t.boolean :important, default: false

      t.timestamps
    end
  end
end
