class ApplicationController < ActionController::Base

  before_action :ensure_xhr_for_js

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def noindex
    response.headers["X-Robots-Tag"] = "noindex"
  end

private

  def json_error(msg)
    render json: {error: msg}, status: :bad_request
  end


  # from https://signalvnoise.com/posts/3697-server-generated-javascript-responses?29#comments
  def ensure_xhr_for_js
    if request.get? && request.format && (request.format.js? || request.format.json?)
      head :forbidden unless request.xhr?
    end
  end

end
