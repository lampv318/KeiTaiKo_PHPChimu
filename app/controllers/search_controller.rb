class SearchController < ApplicationController
  before_action :set_search
  attr_reader :users
  attr_reader :reviews

  def set_search
    q = params[:q]
    binding.pry
    @users = User.search(name_cont: q).result.page params[:page]
    @reviews = Review.search(name_cont: q).result.where(is_confirm: true).page params[:page]
  end
end
