class SplashController < ApplicationController
  allow_unauthenticated_access only: %i[splash]

  def splash
    redirect_to home_path if authenticated?
  end
end
