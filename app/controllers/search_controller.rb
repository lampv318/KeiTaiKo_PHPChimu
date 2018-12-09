class SearchController < ApplicationController
  before_action :set_search
  attr_reader :users
  attr_reader :reviews

  def set_search
    q = params[:q]
    @users = User.search(name_cont: q).result
    @users_num = @users.count
    @users = @users.page params[:page]
    @reviews = Review.search(name_cont: q).result.where(is_confirm: true)
    @reviews_num = @reviews.count
    @reviews = @reviews.page params[:page]
  end
end
