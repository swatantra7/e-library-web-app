class CreateSubjectCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_categories do |t|
      t.integer :category_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
