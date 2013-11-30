# -*- coding: utf-8 -*-
module TwitterOmniauthHelper
  def signed_in?
    session[:oauth_token] != nil
  end

  def create_client
# これ、ダメ
#    client = Twitter::Client.new(
#      :consumer_key => session[:consumer_key],
#      :consumer_secret => session[:consumer_secret],
#      :oauth_token => session[:oauth_token],
#      :oauth_token_secret => session[:oauth_token_secret]     
#    )
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = session[:consumer_key]
      config.consumer_secret = session[:consumer_secret]
      config.access_token = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]     
    end
    return client
  end

  def set_auth_session(auth)
    if auth
      session[:consumer_key] = auth.extra.access_token.consumer.key
      session[:consumer_secret] = auth.extra.access_token.consumer.secret
      session[:oauth_token] = auth.credentials.token
      session[:oauth_token_secret] = auth.credentials.secret
      session[:username] = auth.extra.access_token.params[:screen_name]
    else
      session[:consumer_key] = nil
      session[:consumer_secret] = nil
      session[:oauth_token] = nil
      session[:oauth_token_secret] = nil
      session[:username] = nil
    end
  end
end
