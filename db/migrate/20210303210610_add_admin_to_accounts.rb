class AddAdminToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :administrator, :boolean, default: false
  end
end
