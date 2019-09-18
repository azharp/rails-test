class QuestionsController < ApplicationController
  # TODO: Please check out the test file to determine the methods you need to implement for this controller.
  def index
    render json: Question.all.limit(3)
  end

  def show
    id = params[:id]

    begin
      render json: Question.find(id)
    rescue ActiveRecord::RecordNotFound
      render :status => 404
    end
  end

  def answer
    begin
      UserAnswer.create answer_param
      render json: true
    rescue ActiveRecord::RecordNotFound
      render :status => 404
    end
  end

  private

  def question
    params.require(:question).permit(:id)
  end

  def answer_param
    params.require(:answer).permit(:id, question: [:answer])
  end
end
