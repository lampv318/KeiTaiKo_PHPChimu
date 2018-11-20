class SearchController < ApplicationController
  before_action :set_search
  attr_reader :users
  attr_reader :reviews

  def set_search
    q = params[:q]
    @users = User.search(name_cont: q).result.page params[:page]
    @reviews = Review.checked_review.search(name_cont: q).result.page params[:page]
  end
end
