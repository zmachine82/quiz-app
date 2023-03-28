class Question < ApplicationRecord
  validate :single_correct_answer
  belongs_to :quiz_test
  has_many :choices

  accepts_nested_attributes_for :choices

  def correct_answer
    choices.where({correct: true}).first
  end

  def score_question(possible_answer)
    if possible_answer == nil
      raise "Missing answer for question #{id}"
    end

  # adding data to that original array that will eventually go back to the user to let them know what they got right/wrong
  {answer: possible_answer, correct: possible_answer[:choice_id] == correct_answer.id, correct_choice: correct_answer.id}
  end

  private

  def single_correct_answer
    if choices.filter{|x| x.correct}.size != 1
      errors.add(:unclear_correct_answer, "Question '#{text}' must contain excatly 1 correct answer")
    end
  end
end
