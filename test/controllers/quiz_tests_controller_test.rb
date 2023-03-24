require "test_helper"

class QuizTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_test = quiz_tests(:one)
  end

  test "should get index" do
    get quiz_tests_url, as: :json
    assert_response :success
  end

  test "should create quiz_test" do
    assert_difference("QuizTest.count") do
      post quiz_tests_url, params: { quiz_test: { name: @quiz_test.name } }, as: :json
    end

    assert_response :created
  end

  test "should show quiz_test" do
    get quiz_test_url(@quiz_test), as: :json
    assert_response :success
  end

  test "should update quiz_test" do
    patch quiz_test_url(@quiz_test), params: { quiz_test: { name: @quiz_test.name } }, as: :json
    assert_response :success
  end

  test "should destroy quiz_test" do
    assert_difference("QuizTest.count", -1) do
      delete quiz_test_url(@quiz_test), as: :json
    end

    assert_response :no_content
  end
end
