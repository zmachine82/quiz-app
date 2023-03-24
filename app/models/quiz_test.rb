class QuizTest < ApplicationRecord
    has_many :questions
    accepts_nested_attributes_for :questions

    def score(answers)
        scored = []
        questions.each do |question|
            answer = answers.detect{|x| x[:question_id] == question.id}
            if answer == nil
                raise "Missing answer for question #{question.id}"
            end
            scored.push({answer: answer, correct: answer[:choice_id] == question.correct_answer.id, correct_choice: question.correct_answer.id})
        end
        correct_size = scored.select{|x| x[:correct]}.size
        {answers: scored, total_score: (correct_size.to_f / scored.size.to_f)}
    end
end
