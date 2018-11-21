class BrandsController < ApplicationController
  before_action :find_brand

  def show
    @brand_all = Brand.all
    @review_recent = Review.where(is_confirm: true).last(3)
    @reviews_of_brand = brand.reviews.order("created_at DESC").
      where(is_confirm: true).page params[:page]
  end

  private

  attr_reader :brand

  def find_brand
    @brand = Brand.find_by id: params[:id]
  end
end
