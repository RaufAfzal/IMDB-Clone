class AddSortToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :sort, :integer
  end
end
