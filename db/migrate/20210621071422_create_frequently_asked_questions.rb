class CreateFrequentlyAskedQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
