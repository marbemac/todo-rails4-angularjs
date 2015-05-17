class Api::BaseController < ApplicationController
  # before_filter :authenticate_user!
  before_filter :set_cache_buster

  private

  def permission_denied
    render json: {error: 'unauthorized'}, status: :unauthorized
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
