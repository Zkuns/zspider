class Decoder < ActiveRecord::Base
  def initialize url
    @base_url = url
  end

  def parse file, deep
    doc = Nokogiri::HTML(file)
    body = doc.css('body')
    if deep == 0
      links = []
    else
      links = doc.css('a').map do |a_tag|
        link = rebuild_url a_tag['href'].to_s
      end 
    end
    [links, body]
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
