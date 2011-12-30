class AddSourcePathToSiteFiles < ActiveRecord::Migration
  def change
    add_column :site_files, :source_path, :string
  end
end
