class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_no
      t.decimal :balance
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
