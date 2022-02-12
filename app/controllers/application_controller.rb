class ApplicationController < ActionController::Base
    #アカウント登録時
    before_action :configure_permitted_parameters, if: :devise_controller?
    #登録情報更新時
    before_action :configure_account_update_parameters, if: :devise_controller?

    protected
        #アカウント登録時
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        end

        #登録情報更新時
        def configure_account_update_parameters
            devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end
end
