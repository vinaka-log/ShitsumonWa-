class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(question_id: @question.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(question_id: @question.id)
    like.destroy
  end

  private

  def set_variables
    @question = Question.find(params[:question_id])
    @id_name = "#like-link-#{@question.id}"
  end

end