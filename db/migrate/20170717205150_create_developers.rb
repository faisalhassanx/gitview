class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :github
      
      t.timestamps
    end
  end
end
