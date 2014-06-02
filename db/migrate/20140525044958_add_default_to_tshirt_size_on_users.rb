class AddDefaultToTshirtSizeOnUsers < ActiveRecord::Migration
  def up
    change_column_default :users, :tshirt_size, "med"
  end

  def down
    change_column_default :users, :tshirt_size, nil
  end
end
