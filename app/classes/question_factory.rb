
require_relative "./score_list"

class QuestionFactory
    def self.get_question(question)
        if question.question_type == 'fill_in'
            q = FillInTheBlank.new(question)
          elsif question.question_type == 'multiple_choice' 
            q = MultipleChoice.new(question)
          end
          return q
    end

end