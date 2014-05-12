class CreateApplicationsEvents < ActiveRecord::Migration
  def change
    create_join_table :camp_applications, :events do |t|
      t.index :camp_application_id
      t.index :event_id
    end
  end
end
