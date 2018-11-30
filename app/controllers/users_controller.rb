class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    unless @user.present?
      flash[:danger] = t ".cant_find"
      redirect_to root_path
    end
  end
end
