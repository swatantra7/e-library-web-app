class AddColumnStatusToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :status, :string
  end
end
