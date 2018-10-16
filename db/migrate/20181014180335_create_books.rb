class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :subject_id
      t.decimal :price
      t.string :status
      t.boolean :payable
      t.timestamps
    end
  end
end