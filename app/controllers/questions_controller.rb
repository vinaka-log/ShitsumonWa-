class QuestionsController < ApplicationController
  before_action :require_login, except: %i[index show search]
  before_action :set_question, only: %i[show edit update]

  def index
    @questions = Question.all
    @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
    comments = Comment.where(id: params[:id])
  end

  def show
    @user = User.find_by(id: @question.user_id)
    @comments = @question.comments
    @comment = Comment.new
  end

  def new
    @question = Question.new 
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, success: "Question save"
    else
      flash.now[:danger] = "Question fail"
      render 'new'
    end
  end

  def search
    selection = params[:keyword]
    @questions = Question.sort(selection)
    @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
  end

  def edit; end

  def update
    if @question.update_attributes(question_params)
      flash[:success] = "Question update"
      redirect_to questions_url
    else
      flash.now[:danger] = "Question fail"
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy!
    flash[:success] = "Question delete"
    redirect_to questions_url
  end


    private

      def question_params
        params.require(:question).permit(:name, :description, :image).merge(user_id: current_user.id)
      end

      def set_question
       @question = Question.find(params[:id])
      end
    
end

