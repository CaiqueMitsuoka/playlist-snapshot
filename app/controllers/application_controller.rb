class ApplicationController < ActionController::Base
  before_action :check_login

  private

  def check_login
    redirect_to root_path unless session['spotify_user']
  end

  def user
    @user ||= RSpotify::User.new(session['spotify_user'])
  end
end
