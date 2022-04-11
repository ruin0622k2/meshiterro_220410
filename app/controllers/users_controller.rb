class UsersController < ApplicationController
  #@post_images = @User.post_images　は、アソシエーションを持っているモデル同士の記述方法
  #特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し、@post_imagesに渡すことができる
  #つまり個人が投稿したもの全てを表示できる
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
end
