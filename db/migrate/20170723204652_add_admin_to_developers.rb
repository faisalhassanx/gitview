class AddAdminToDevelopers < ActiveRecord::Migration[5.1]
  def change
    add_column :developers, :admin, :boolean, default: false
  end
end
