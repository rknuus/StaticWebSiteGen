class CreatePageFiles < ActiveRecord::Migration
  def change
    create_table :page_files do |t|
      t.integer :page_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
