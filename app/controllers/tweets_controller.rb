class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @tweets = Tweet.includes(:user)
    @new = Tweet.includes(:user).last(3)
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
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'Itemを投稿しました'
    else
      flash.now[:alert] = '全ての項目を入力してください。'
      render :new
    end

  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path, notice:'itemを削除しました'
    

  end

  

  private
  def tweet_params
    params.require(:tweet).permit( toukouimages_attributes: [:image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
