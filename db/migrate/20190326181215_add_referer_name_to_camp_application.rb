class AddRefererNameToCampApplication < ActiveRecord::Migration
  def change
    add_column :camp_applications, :referer_name, :string
  end
end
