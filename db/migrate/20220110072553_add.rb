class Add < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :comment, :text
  end
end
