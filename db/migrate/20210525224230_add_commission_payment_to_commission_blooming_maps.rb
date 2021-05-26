class AddCommissionPaymentToCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      CREATE TYPE commission_payment AS ENUM ('not_paid', 'deposit_paid', 'paid_in_full');
    SQL
    add_column :commission_blooming_maps, :commission_payment, :string, default: :not_paid
  end
end
