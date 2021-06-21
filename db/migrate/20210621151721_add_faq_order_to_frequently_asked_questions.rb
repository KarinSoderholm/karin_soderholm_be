class AddFaqOrderToFrequentlyAskedQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :frequently_asked_questions, :FAQOrder, :integer, default: 1
  end
end
