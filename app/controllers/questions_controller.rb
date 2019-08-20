class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @user_response = UserResponse.new
  end

  def show
  end
end
