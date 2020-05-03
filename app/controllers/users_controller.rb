class UsersController < ApplicationController
  before_action :set_brand, only: [:index, :show, :like]

  def index
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets
  end

  def like
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end
end

private

def set_brand
  @parents = Category.all
  @brand = Brand.all
end