class AddImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :location
      t.integer :wiki_id
    end
    
    add_index :images, :wiki_id
      
  end
end
