class AlterAddresses2 < ActiveRecord::Migration[7.1]
  def change
    add_index :addresses, :postal_code
  end
end
