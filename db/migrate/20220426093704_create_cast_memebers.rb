class CreateCastMemebers < ActiveRecord::Migration[5.2]
  def change
    create_table :cast_memebers do |t|
      t.string :name
      t.belongs_to :movie, foreign_key: true

      t.timestamps
    end
  end
end
