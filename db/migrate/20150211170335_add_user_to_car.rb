class AddUserToCar < ActiveRecord::Migration
  def change
    add_column :cars, :userid, :integer
  end
end
