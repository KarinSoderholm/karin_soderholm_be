class FrequentlyAskedQuestion < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true
  validates :faq_order, presence: true

  def self.total_frequently_asked_questions
    FrequentlyAskedQuestion.all.count
  end

  def self.is_ordered_properly?
    all_orders = FrequentlyAskedQuestion.select(:faq_order, :id)

    if all_orders.length == all_orders.uniq.length
      return true
    else
      return false
    end
  end
end
