class OmniauthController < ApplicationController
    
    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
        else
            flash[:error] = 'Hubo un error al iniciar sesión con Google. Por favor, inténtelo de nuevo.'
            redirect_to new_user_registration_url
        end
    end

    def failure
        flash[:error] = 'Hubo un error al iniciar sesión con Google. Por favor, inténtelo de nuevo.'
        redirect_to new_user_registration_url
    end
end

