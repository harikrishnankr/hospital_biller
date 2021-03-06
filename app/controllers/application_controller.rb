class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  after_filter :flash_to_headers

def flash_to_headers
  return unless request.xhr?
  response.headers['X-Message'] = flash[:error]  unless flash[:error].blank?
  # repeat for other flash types...

  flash.discard  # don't want the flash to appear when you reload page
end
  protect_from_forgery with: :exception
end
