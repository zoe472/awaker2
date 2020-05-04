class BrandsController < ApplicationController
 


  def create
    @brands = Brand.create(brand_params)
    @quest = Quest.find_by(user_id: brand_params[:user_id])
    if @brands.save
      @quest.delete
      redirect_to admin_users_path, notice: '登録を完了しました'
    else
      redirect_to admin_users_path, notice: '登録できませんでした'
    end
  end

  

  private
  def brand_params
    params.require(:brand).permit(:name, :user_id)
  end

  def set_brand
    @parents = Category.all
    @brand = Brand.all
  end
end
