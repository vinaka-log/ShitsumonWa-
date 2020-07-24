class StocksController < ApplicationController
  before_action :require_login, only: %i[index create destroy]

  def index
    stock_questions = Stock.get_stock_questions(current_user)
    @stock_questions = Kaminari.paginate_array(stock_questions).page(params[:page]).per(10)
  end

  def create
    @question = Question.find(params[:question_id])
    unless @question.stocked?(current_user)
      @question.stock(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
     end
  end

  def destroy
    @question = Stock.find(params[:id]).question
    if @question.stocked?(current_user)
      @question.unstock(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
     end
   end
end
