class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authentic_user! #devise method authentic_user
end
