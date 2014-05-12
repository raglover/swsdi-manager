class AddCampToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :camp, index: true
  end
end
