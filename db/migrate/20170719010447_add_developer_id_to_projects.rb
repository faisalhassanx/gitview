class AddDeveloperIdToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :developer_id, :integer
  end
end
