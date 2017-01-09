class ModifyScheduleUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :schedule_users, :evaluation, :integer, default: nil
    add_column    :schedule_users, :comment,    :string,  default: nil
  end
end
