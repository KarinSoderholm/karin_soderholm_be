class CommissionBloomingMap < ApplicationRecord
  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :customer_phone, presence: true
  validates :message, presence: true
  validates :map_city, presence: false
  validates :map_state, presence: false
  validates :map_country, presence: false
  validates :map_color, presence: false
  validates :notes, presence: false
  validates :price, presence: false

  enum commission_status: { not_started: 'not_started', started: 'started', finished: 'finished', delivered: 'delivered' }, _prefix: :commission_status
  enum commission_payment: { not_paid: 'not_paid', deposit_paid: 'deposit_paid', paid_in_full: 'paid_in_full'}, _prefix: :commission_payment

  def self.find_all_unfinished_commissed_maps
    where.not(commission_status: 'delivered').count
  end

  def self.total_finished
    where(commission_status: 'delivered').count
  end

  def get_readable_commission_status
    if self.commission_status == 'not_started'
      return "Not started"
    elsif self.commission_status == 'started'
      return "Started"
    elsif self.commission_status == 'finished'
      return "Finished"
    elsif self.commission_status == 'delivered'
      return "Delivered"
    end
  end

  def get_readable_commission_payment
    if self.commission_payment == 'not_paid'
      return "Not paid"
    elsif self.commission_payment == 'deposit_paid'
      return "Deposit paid"
    elsif self.commission_payment == 'paid_in_full'
      return "Paid in full!"
    end
  end

  def self.total_revenue
    self.subtotal_deposits + self.subtotal_paid_in_full
    # where.not(price: nil).sum(:price)
    # where(commission_payment: 'deposit_paid').or(self.where(commission_payment: 'paid_in_full')).sum(:price)
    # group("commission_payment").sum(:price) #this returns a hash with the subtotals for each type
  end

  def self.subtotal_deposits
    # group('commission_payment').sum(:price)['deposit_paid'] / 2
    where(commission_payment: 'deposit_paid').sum(:price) / 2
  end

  def self.subtotal_paid_in_full
    where(commission_payment: 'paid_in_full').sum(:price)
  end
end
