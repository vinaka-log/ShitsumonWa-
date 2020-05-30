class QuestionsController < ApplicationController

  def index
    @questions = Question.all.includes(:like_users)
  end

  def show
    @question = Question.find(params[:id])
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
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update!
    redirect_to questions_url, notice: "#{question.name}.saved"
  end

  def destroy
    question = Queston.find(params[:id])
    question.destroy!
    flash[:success] = "#{question.name} deleted"
    redirect_to questions_url
  end


    private

      def question_params
        params.require(:question).permit(:name, :description, :image )
      end
    

end

