class QuestsController < ApplicationController
  before_action :set_brand, only: [:new]
  before_action :admin_user, only: [:show]


  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(brand_params)
    if @quest.save
      redirect_to root_path, notice: '申請を完了しました'
    else
      redirect_to root_path, notice: '申請できませんでした'
    end
  end

  def show
    @quest = Quest.find(params[:id])
    @brands = Brand.new
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.delete
    redirect_to admin_users_path, notice:'申請を否認しました'
  end

  

  private
  def brand_params
    params.require(:quest).permit(:brandname).merge(user_id: current_user.id)
  end
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def set_brand
    @parents = Category.all
    @brand = Brand.all
  end
end
