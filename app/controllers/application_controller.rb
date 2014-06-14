class ApplicationController < ActionController::Base

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

end
