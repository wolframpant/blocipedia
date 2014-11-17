class AddPersonalToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :personal, :boolean
  end
end
