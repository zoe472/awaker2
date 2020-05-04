class UsersController < ApplicationController
  before_action :set_brand, only: [:home, :show, :like]

  def home
    @user = User.find(params[:id])
    @quest = Quest.find_by(user_id: @user.id)
    @tweets = @user.tweets.last(4)
    @likes = Like.where(user_id: @user.id).last(4)
    @brands = Brand.find_by(user_id: @user.id)
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

private
  def set_brand
    @parents = Category.all
    @brand = Brand.all
  end