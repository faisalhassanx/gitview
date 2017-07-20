class AddPasswordDigestToDevelopers < ActiveRecord::Migration[5.1]
  def change
    add_column :developers, :password_digest, :string
  end
end
