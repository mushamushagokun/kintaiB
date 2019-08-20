class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include AttendancesHelper
  
  def create_csv_file_header(csv_file_name)
        file_name = ERB::Util.url_encode(file_name) if (/MSIE/ =~ request.user_agent) || (/Trident/ =~ request.user_agent)
        headers['Content-Disposition'] = "attachment; filename=\"#{file_name}.csv\""
  end
end
