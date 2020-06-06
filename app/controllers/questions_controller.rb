class QuestionsController < ApplicationController
  before_action :require_login, except: [:index, :show,]

  def index
    @questions = Question.page(params[:page]).per(5).order('updated_at DESC').includes(:like_users)
    comments = Comment.where(id: params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find_by(id: @question.user_id)
    @comments = @question.comments
    @comment = Comment.new
  end

  def new
    @question = Question.new
     
  end

  def create
    @question = Question.new(question_params)
    @question.save!
    redirect_to questions_url, notice: "#{@question.name}.saved"
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "#{@question.name}.saved"
      redirect_to questions_url
    else
      render 'questons/edit'
    end
  end

  def destroy
    question = Queston.find(params[:id])
    question.destroy!
    flash[:success] = "#{question.name} deleted"
    redirect_to questions_url
  end


    private

      def question_params
        params.require(:question).permit(:name, :description, :image).merge(user_id: current_user.id)
      end
    

end

