class CreateCoachComments < ActiveRecord::Migration
  def change
    create_table :coach_comments do |t|
      t.text :strengths
      t.text :weaknesses
      t.text :goals
      t.belongs_to :camp_application, index: true

      t.timestamps null: false
    end

    add_column :camp_applications, :uuid, :string, index: true, null: false
  end
end
