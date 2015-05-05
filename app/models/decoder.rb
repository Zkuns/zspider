class Decoder < ActiveRecord::Base
  def initialize url
    @base_url = url
  end

  def parse file
    doc = Nokogiri::HTML(file)
    links = doc.css('a').map do |a_tag|
      link = rebuild_url a_tag['href'].to_s
    end 
    links
  end

  def rebuild_url url
    if url.start_with? 'http'
      url
    elsif (url == "#") || (url.start_with? 'java')
    else
      @base_url + url
    end
  end
end
