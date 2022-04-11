Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"

#onlyオプションを使用することで、生成するルーティングを限定できる
#今回の場合、new,create,index,show以外のルーティングは行われない
#理由としては、画像投稿の機能では「新規投稿(new)」「一覧(index)」「詳細機能(show)」「削除(destroy)」しか必要ない為
#空のモデルでは、PostImage モデルで定義したカラムを@post_image.user_idのように、"[モデル名].[カラム名]"という形で繋げることで、保存するカラムの中身を操作することができる。
  resources :post_images, only:[:new, :create, :index, :show, :destroy]
#userコントローラ用のルーティングの記述
  resources :users, only:[:show, :edit, :update]
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
