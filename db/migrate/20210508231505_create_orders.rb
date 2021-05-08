class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :type_order, null: false, default: 'deposito'
      t.decimal :value, precision: 10, scale: 2, default: 0.0
      t.decimal :fee, precision: 5, scale: 2, default: 0.0
      t.integer :status, null: false, default: 0
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
