require_relative "../classes/question_factory"
class QuizTestsController < ApplicationController
  before_action :set_quiz_test, only: %i[ show update destroy take_test ]

  # GET /quiz_tests
  def index
    @quiz_tests = QuizTest.all

    render json: @quiz_tests
  end

  # GET /quiz_tests/1
  def show
    render json: @quiz_test
  end

  # POST /quiz_tests
  def create
    @quiz_test = QuizTest.new(quiz_test_params)   

    @quiz_test.questions.each do |question|
      
      q = QuestionFactory.get_question(question)
       if !q.valid?
         render json: {error: "#{question.text} of type #{question.question_type}, valid state: #{q.valid?}"}, status: :unprocessable_entity 
         return
        end
    end

    if @quiz_test.save
      render json: @quiz_test, status: :created, location: @quiz_test
    else
      render json: @quiz_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quiz_tests/1
  def update
    if @quiz_test.update(quiz_test_params)
      render json: @quiz_test
    else
      render json: @quiz_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quiz_tests/1
  def destroy
    @quiz_test.destroy
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
      params.require(:quiz_test).permit(:id,  :test_id, answers: [:question_id, :choice_id])
    end
end
