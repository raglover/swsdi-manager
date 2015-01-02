class AddVerifyFieldsToCampApplications < ActiveRecord::Migration
  def change
    add_column :camp_applications, :med_forms, :boolean
    add_column :camp_applications, :app_fee, :boolean
    add_column :camp_applications, :checkout_form, :boolean
    add_column :camp_applications, :incomplete, :boolean
    add_column :camp_applications, :missing_info, :text
  end
end
