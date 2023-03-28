require_relative '../classes/score_list'

class QuizTest < ApplicationRecord
    has_many :questions
    accepts_nested_attributes_for :questions

    def score(answers)
        score_list = ScoreList.new

        questions.each do |question|
            answer = find_answer_for_question(answers, question)
            score_list.add_scored_question_to_response(question.score_question(answer))
        end

        score_list.respond_with_all_answers
    end

    private 

    def find_answer_for_question(answers, question)
        answers.detect{|x| x[:question_id] == question.id}
    end
end
