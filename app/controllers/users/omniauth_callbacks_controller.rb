# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  def after_sign_in_path_for(user)
    user_url(user)
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      logger.info('persisted true')
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      logger.info('persisted false')
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to controller: 'sessions', action: 'new'
    end
  end
end
