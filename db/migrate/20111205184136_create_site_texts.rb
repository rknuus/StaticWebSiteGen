class CreateSiteTexts < ActiveRecord::Migration
  def change
    create_table :site_texts do |t|
      t.integer :site_id
      t.text :content

      t.timestamps
    end
  end
end
