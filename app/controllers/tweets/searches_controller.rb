class Tweets::SearchesController < ApplicationController
  before_action :set_brand, only: [:index]
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      @tweets = Tweet.search(params[:keyword])
      @tag = Tag.tagsearch(params[:keyword])
      @posts =  Brand.brandsearch(params[:keyword])
      @category =  Category.categorysearch(params[:keyword])
    else
      redirect_to root_path
    end
  end
end

private
  def set_brand
    @parents = Category.all
    @brand = Brand.all
  end
