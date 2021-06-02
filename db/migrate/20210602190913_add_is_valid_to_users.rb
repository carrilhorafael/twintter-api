class AddIsValidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_valid, :boolean, default: false
  end
end
