class CreateProjectTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :project_types do |t|
      t.integer :project_id
      t.integer :type_id
    end
  end
end
