class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  private
  #  画像の保存を許可するストロングパラメータに書き換えること（ 商品出品機能）
  # def message_params
    # params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  # end
end
