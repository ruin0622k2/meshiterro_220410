class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

#投稿データの保存
#post_image.user_id
#user_idは画像投稿を行う際に、「どのユーザーが投稿したのか」を「ユーザーの ID で判断する」ためのカラム
#空のモデルでは、PostImage モデルで定義したカラムを@post_image.user_idのように、"[モデル名].[カラム名]"という形で繋げることで、保存するカラムの中身を操作することができる。
#current_user は、コードに記述するだけで、ログイン中のユーザーの情報を取得できる(deviseのインストール必須)
  def create
    @post_image = PostImage.new(post_image_params)
#@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to '/index'
  end

private

#投稿データに対するストロングパラメータの記述
#post_image_paramsメソッドでは、フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェックしてる
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end