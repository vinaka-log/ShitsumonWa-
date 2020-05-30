class LikesController < ApplicationController

  def index
    @like_questions = current_user.like_questions
  end

  def create
    like = Like.new
    like.user_id = current_user.id
    like.question_id = params[:question_id]

    if like.save
      redirect_to questions_path, success: 'Like success!!'
    else
      redirect_to questions_path, danger: 'Like failed!!'
    end
  end

  def destroy 
    @like_questions = current_user.like_questions.find_by(question_id: params[:question_id])
  end
end
