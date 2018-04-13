class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?
  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	  end

	  # サインイン後のリダイレクト先をマイページへ
	  def after_sign_in_path_for(resource)
	  	flash[:log_in] = "ログインが成功しました"
    	user_path(current_user.id)
  	end

  	# サインアウト後のリダイレクト先をトップページへ
  	def after_sign_out_path_for(resource)
	  	flash[:log_out] = "ログアウトしました"
    	top_path
  	end
end
