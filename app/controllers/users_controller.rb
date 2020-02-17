class UsersController < ApplicationController

  def index
  end

  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets
  end
end
