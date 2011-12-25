class CreateSiteFiles < ActiveRecord::Migration
  def change
    create_table :site_files do |t|
      t.integer :site_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
