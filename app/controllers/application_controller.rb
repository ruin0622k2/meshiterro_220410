class ApplicationController < ActionController::Base
#「if」以降の記述によって、devise利用の機能（ユーザー登録、ログイン機能）の前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

#after_sign_in_path_for(resource)で、サインイン後にどこに遷移するかを設定している
  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end


  protected

#devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可している
#ストロングパラメーターと同様の機能
#privateは記述したコントローラ内でしか参照できないが、protectedは呼び出された他のコントローラからも参照可能

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end
end
