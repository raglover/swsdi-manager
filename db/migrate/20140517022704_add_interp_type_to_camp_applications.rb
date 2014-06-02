class AddInterpTypeToCampApplications < ActiveRecord::Migration
  def change
    add_column :camp_applications, :interp_type, :string
  end
end
