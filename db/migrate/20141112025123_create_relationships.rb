class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :wiki_id
      t.integer :user_id
      t.boolean :creator_created
      t.boolean :collaborator
    end

    add_index :users, :id, unique: true
    add_index :wikis, :id, unique: true
    add_index :relationships, :id, unique: true
    add_index :relationships, :user_id
    add_index :relationships, :wiki_id
    
  end
end
