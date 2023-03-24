class Question < ApplicationRecord
  belongs_to :quiz_test
  has_many :choices

  accepts_nested_attributes_for :choices

  def correct_answer
    choices.where({correct: true}).first
  end
end
