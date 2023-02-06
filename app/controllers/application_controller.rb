class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_response_headers, except: [ ]
#  helper_method 
  before_action :authenticate_user!
  before_action :force_tablet_html
#  has_mobile_fu
  before_action do
    RecordWithOperator.operator = current_user || User.first
  end

  def force_tablet_html
      session[:tablet_view] = false
  end

  def set_response_headers
    response.headers['Pragma']        = 'no-cache'
    response.headers['Cache-Control'] = 'no-store'
    response.headers['Expires']       = 'Thu, 01 Dec 1994 16:00:00 GMT'
  end
end
