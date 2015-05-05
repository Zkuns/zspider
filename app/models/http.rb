class Http < ActiveRecord::Base
  def get url
    begin
      require 'open-uri'
      file = open url
    rescue Exception => e
    end
  end
end
