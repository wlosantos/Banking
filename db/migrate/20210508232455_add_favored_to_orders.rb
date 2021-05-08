class AddFavoredToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :favored, null: true, foreign_key: { to_table: 'accounts' }
  end
end
