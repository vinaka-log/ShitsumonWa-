class StocksController < ApplicationController

  def index
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
