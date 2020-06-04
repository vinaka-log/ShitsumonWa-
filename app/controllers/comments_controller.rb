class CommentsController < ApplicationController

  def new
    @question = Question.find(params["question_id"])
    @comment = @question.comments.new
  end
  
  def create
    question = Question.find(params[:question_id])
    @comment = question.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment success"
      redirect_back(fallback_location: question_url(question.id))
    else
      flash[:danger] = "Comment failed"
      redirect_back(fallback_location: question_url(question.id))
    end 
  end

  def destroy
    question = Question.find(params[:question_id])
    @comment = question.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: question_path(question))
  end

    private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
