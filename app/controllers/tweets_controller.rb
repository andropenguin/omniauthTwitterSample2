class TweetsController < ApplicationController
  include TwitterOmniauthHelper

  def input
  end

  def update
    if signed_in?
      client = create_client
      client.update(params[:message])
      redirect_to root_url, :notice => "success"
    else
      redirect_to root_url, :notice => "not signed_in"
    end
  end
end
