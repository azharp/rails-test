class QuestionsController < ApplicationController
  # TODO: Please check out the test file to determine the methods you need to implement for this controller.
  def index
    render json: Question.all.limit(3)
  end

  def show
    id = params[:id]

    if id.empty?
      return render :status => :unprocessable_entity
    end

    begin
      render json: Question.find(id)
    rescue ActiveRecord::RecordNotFound
      render :status => :not_found
    end
  end

  def answer
    id = params[:id]
    answer = params[:question][:answer]

    if answer.empty? || id.empty?
      return render :status => :unprocessable_entity
    end

    begin
      question = Question.find(id)
      render json: {correct: question.check_answer(answer)}, :status => 200
    rescue ActiveRecord::RecordNotFound
      render :status => :not_found
    end
  end
end
