class CreateHearts < ActiveRecord::Migration[5.1]
  def change
    create_table :hearts do |t|
      t.boolean :heart
      t.integer :developer_id, :project_id
      
      t.timestamps
    end
  end
end
