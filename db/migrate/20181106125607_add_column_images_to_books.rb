class AddColumnImagesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :images, :attachment
  end
end
