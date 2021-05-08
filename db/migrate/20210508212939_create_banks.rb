class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.string :name, null: false
      t.string :cod_bank, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
