class RenameFaqOrderToFaqOrderToFrequentlyAskedQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :frequently_asked_questions, :FAQOrder, :faq_order
  end
end
