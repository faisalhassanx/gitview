class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :tagline
      t.text :description
      t.string :link
      t.string :github
      
      t.timestamps
    end
  end
end
