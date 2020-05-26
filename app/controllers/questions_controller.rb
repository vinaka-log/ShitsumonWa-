class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.save!
    redirect_to questions_url, notice: "#{question.name}.saved"
  end

  def edit
  end


    private

      def question_params
        params.require(:question).permit(:name, :description)
      end
    

end

