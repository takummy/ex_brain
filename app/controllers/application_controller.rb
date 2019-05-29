class ApplicationController < ActionController::Base
  include ApplicationHelper

  def require_correct_user
    user = User.find(params[:id])
    unless current_user?(user)
      flash[:danger] = "権限がありません"
      redirect_to root_path
    end
  end
end