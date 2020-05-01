class Tweets::SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @tweets = Tweet.search(params[:keyword])
    @tag = Tag.tagsearch(params[:keyword])
    @posts =  Brand.brandsearch(params[:keyword])
    @category =  Category.categorysearch(params[:keyword])
  end
end
