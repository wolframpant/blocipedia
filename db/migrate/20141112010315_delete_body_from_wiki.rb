class DeleteBodyFromWiki < ActiveRecord::Migration
  def change
    remove_column :wikis, :body, :string
    add_column :wikis, :body, :text
  end
end
