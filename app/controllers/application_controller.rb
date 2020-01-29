class ApplicationController < ActionController::Base
 before_action :authenticate_user! #ログインしていない状態でアクセスされた場合は、ログイン画面へリダイレクトするように設定,:authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end