class AddAtmMachineToTransactions < ActiveRecord::Migration
  def change
    add_reference :transactions, :atm_machine, index: true, foreign_key: true
  end
end
