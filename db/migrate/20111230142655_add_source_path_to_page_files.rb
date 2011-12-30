class AddSourcePathToPageFiles < ActiveRecord::Migration
  def change
    add_column :page_files, :source_path, :string
  end
end
