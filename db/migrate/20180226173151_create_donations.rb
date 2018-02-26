class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.monetize :amount, currency: { present: false }
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.jsonb :payment

      t.timestamps
    end
  end
end
