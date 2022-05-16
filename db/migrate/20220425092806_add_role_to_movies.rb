class AddRoleToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :role, :integer
  end
end
