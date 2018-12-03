class SearchsController < ApplicationController
  before_action :set_search

  def search
    @users = User.all.page params[:page]
    @reviews = @q.result(distin: true).page params[:page]
    render "search/search"
  end

  def set_search
    @q= Review.ransack params[:q]
  end
end
