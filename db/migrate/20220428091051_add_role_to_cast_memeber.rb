class AddRoleToCastMemeber < ActiveRecord::Migration[5.2]
  def change
    add_column :cast_memebers, :role, :integer
  end
end
