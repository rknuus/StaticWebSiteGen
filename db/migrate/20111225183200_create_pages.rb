class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :site_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
