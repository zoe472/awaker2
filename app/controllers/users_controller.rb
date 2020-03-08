class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets
  end

  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
    
  end
end
