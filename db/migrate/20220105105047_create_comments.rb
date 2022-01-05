class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.text :image

      t.timestamps
    end
  end
end
