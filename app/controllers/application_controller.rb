class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  def allowed?(action:, user:)
  	
  end

end
