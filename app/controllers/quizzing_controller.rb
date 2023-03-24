class QuizzingController < ApplicationController
    before_action :set_quiz_test, only: %i[ take_test submit_test ]


     # get /quiz_test/:id/take
  def take_test
    render json: @quiz_test, :include => {:questions => {:include => {:choices => {:only => [:id, :text]}}}} 
  end

  # post /quiz_test/:id/submit
  def submit_test
    render json: @quiz_test.score(params[:answers])
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_test
        @quiz_test = QuizTest.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def quiz_test_params
        params.require(:quiz_test).permit(:name, questions_attributes: [:text, :question_type, choices_attributes: [:correct, :text]])
      end
  
      def submit_params
        params.require(:quizzing).permit(:id,  :test_id, answers: [:question_id, :choice_id])
      end
end
