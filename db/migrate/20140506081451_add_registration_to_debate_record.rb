class AddRegistrationToDebateRecord < ActiveRecord::Migration
  def change
    add_column :debate_records, :registration_id, :string
  end
end
