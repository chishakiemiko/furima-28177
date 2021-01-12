class ApplicationController < ActionController::Base
  
  before_action :basic_auth
  # before_action :authenticate_user!,expect: :index
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date])
    devise_parameter_sanitizer.permit(:accout_update, keys: [:nickname, :email, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date])
  end 

    def basic_auth
     authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222' # 環境変数を読み込む記述に変更
    end
 end

  
end
