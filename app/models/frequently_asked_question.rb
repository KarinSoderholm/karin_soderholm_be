class FrequentlyAskedQuestion < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true

  def self.total_frequently_asked_questions
    FrequentlyAskedQuestion.all.count
  end
end
