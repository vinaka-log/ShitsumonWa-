class CommentsController < ApplicationController

  def new
    @question = Question.find(params["question_id"])
    @comment = @question.comments.new
  end
  
  def create
    @question = Question.find(params["question_id"])
    @comment = @question.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment saved"
      redirect_to questions_path
    else
      flash[:danger] = "Comment failed"
      redirect_back(fallback_location: new_question_comment_path)
    end 
  end

  def show
    @question = Question.find(params[:id])
    @comment = @question.comments.build
  end

  def destroy
    question = Question.find(params[:question_id])
    @comment = question.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: question_path(question))
  end

    private
    def comment_params
      params.require(:comment).permit(:user_id, :question_id, :content)
    end

end
