class ScoreList
    def initialize
        @scored = []
    end
    def add_scored_question_to_response(question)
        @scored.push(question)
    end

    def respond_with_all_answers
        correct_size = @scored.select{|x| x[:correct]}.size
        {answers: @scored, total_score: (correct_size.to_f / @scored.size.to_f)}
    end
end


class MultipleChoice

    def initialize(question)
        @question = question
        if @question.question_type != 'multiple_choice'
            raise "#{@question.text} is not a multiple choice question"
        end
       if !valid?
            @question.quiz_test.errors.add(:invalid_question_type, "choices for question not valid")
       end
    end

    def valid?
        @question.choices.filter{|x| x.correct}.size == 1 && @question.choices.size < 7
    end

end




class FillInTheBlank

    def initialize(question)
        @question = question
 
        if @question.question_type != 'fill_in'
            raise "'#{@question.text}' is not a Fill In The Blank question"
        end

        if !valid?

            @question.quiz_test.errors.add(:invalid_question_type, "choices for question not valid")
       end
    end

    def valid?
        @question.choices.size == 1 && @question.choices[0].correct == true
    end


    
end

