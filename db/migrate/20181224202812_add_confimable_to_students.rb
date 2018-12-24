class AddConfimableToStudents < ActiveRecord::Migration[5.2]
  def change
    # Confirmable
    add_column :students, :confirmation_token, :string
    add_column :students, :confirmed_at, :datetime
    add_column :students, :confirmation_sent_at, :datetime
    add_column :students, :unconfirmed_email, :string # Only if using reconfirmable

    add_index :students, :confirmation_token,   unique: true
  end
end
