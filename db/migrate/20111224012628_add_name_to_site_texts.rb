class AddNameToSiteTexts < ActiveRecord::Migration
  def change
    add_column :site_texts, :name, :string
  end
end
