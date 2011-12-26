class CreatePageTexts < ActiveRecord::Migration
  def change
    create_table :page_texts do |t|
      t.integer :page_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
