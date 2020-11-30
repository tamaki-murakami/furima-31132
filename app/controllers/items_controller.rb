class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
     @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  # def update
  #   if @item.update(item_params)
  #     redirect_to item_path(@item.id)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @item.destroy
  #   redirect_to root_path
  # end

  private

  def set_item
  end

  # def move_to_index
  #   unless current_user.id == @item.user_id
  #     redirect_to action: :index
  #   end
  # end

  def item_params
    columns = [:image, :name, :text, :category_id, :status_id, :burden_id, :prefecture_id, :days_id, :price]
    params.require(:item).permit(columns).merge(user_id: current_user.id)
  end
end