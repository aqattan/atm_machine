class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_no
      t.decimal :ammount
      t.integer :transaction_type
      t.integer :account_id
      t.integer :atm_machine_id
      t.timestamps null: false
    end
  end
end
