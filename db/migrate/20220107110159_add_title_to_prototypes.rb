class AddTitleToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :title, :text
  end
end
