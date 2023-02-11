class AddSpeechMinorToCampApplications < ActiveRecord::Migration
  def change
    add_column :camp_applications, :speech_minor, :string
  end
end
