class AddHealthInfoToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :has_allergies, :boolean
    add_column :registrations, :has_dietary_restrictions, :boolean
    add_column :registrations, :allergies, :string
    add_column :registrations, :dietary_restrictions, :string
  end
end
