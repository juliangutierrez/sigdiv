class RemoveTransactionTypeIdFromTransactionInfos < ActiveRecord::Migration[5.2]
  def change
  	remove_column :transaction_infos, :transaction_type, :integer
  end
end
