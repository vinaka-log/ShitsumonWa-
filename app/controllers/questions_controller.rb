class QuestionsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @questions = Question.all
    @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
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
    if @question.save
      redirect_to questions_path, success: "#{@question.name}.saved"
    else
      flash.now[:danger] = "#{@question.name}.failed"
      render 'new'
    end
  end

  def search
    selection = params[:keyword]
    @questions = Question.sort(selection)
    @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
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
    question = Question.find(params[:id])
    question.destroy!
    flash[:success] = "#{question.name} deleted"
    redirect_to questions_url
  end


    private

      def question_params
        params.require(:question).permit(:name, :description, :image).merge(user_id: current_user.id)
      end
    

end

