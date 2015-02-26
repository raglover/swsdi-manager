class AddReminderFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reminder_flag, :boolean
  end
end
