class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :search]
  def index
    @good_ranks = Tweet.includes(:user).find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(4).pluck(:tweet_id))
    @tweets = Tweet.includes(:user)
    @new = Tweet.includes(:user).last(4)
    @like = Like.new
    # @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @like = Like.new
  end

  def new
    @tweet = Tweet.new
    @images = @tweet.toukouimages.build
    @parents = Category.all
    @brand = Brand.all
  end

 
  def create
    @parents = Category.all
    @brand = Brand.all
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      tag_list = tag_params[:tag_names].split(/[[:blank:]]+/).select(&:present?)
      if tag_list.length < 6
        @tweet.save_tags(tag_list)
      end
      redirect_to root_path, notice: 'Itemを投稿しました'
    else
      redirect_to new_tweet_path, notice: 'URL以外の全ての項目を入力してください'
    end

  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path, notice:'itemを削除しました'
    

  end

  

private
  def tweet_params
    params.require(:tweet).permit(:catchcopy, :text, :category_id, :url, :brand_id, toukouimages_attributes: [:image]).merge(user_id: current_user.id)
  end

  def tag_params
    params.require(:tweet).permit(:tag_names)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
