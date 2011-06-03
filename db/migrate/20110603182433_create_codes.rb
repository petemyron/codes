class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.string :code
      t.string :productId
      t.string :amount
      t.text :description
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :codes
  end
end
