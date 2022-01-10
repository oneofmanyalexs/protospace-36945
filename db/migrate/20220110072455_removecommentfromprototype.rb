class Removecommentfromprototype < ActiveRecord::Migration[6.0]
  def change
    remove_column :prototypes, :comment, :text
  end
end
