class SearchsController < ApplicationController
  def search
    @users = User.all.page params[:page]
    @reviews_res = @q.result(distin: true)
    if params[:rate] == "option1"
      @reviews = @reviews_res.price_lt(500)
    elsif params[:rate] == "option2"
      @reviews = @reviews_res.price_gt(500).price_lt(1000)
    elsif params[:rate] == "option3"
      @reviews = @reviews_res.price_gt(1000).price_lt(2000)
    elsif params[:rate] == "option4"
      @reviews = @reviews_res.price_gt(2000)
    else
      @reviews = @reviews_res
    end
    @reviews_num = @reviews.count
    respond_to do |format|
      format.js { render :action => "filter" }
    end
  end
end
