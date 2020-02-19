class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @like = Like.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'Itemを投稿しました'
    else
      flash.now[:alert] = '全ての項目を入力してください。'
      render :new
    end

  end

  

  private
  def tweet_params
    params.require(:tweet).permit(:category, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
