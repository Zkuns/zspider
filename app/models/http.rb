class Http < ActiveRecord::Base
  def get url
    begin
      require 'open-uri'
      file = open url, read_timeout:3
      rescue Exception => e
    end
  end
end
