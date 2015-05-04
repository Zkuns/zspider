class Decoder < ActiveRecord::Base
  def initialize url
    @base_url = url
  end

  def parse file
    doc = Nokegiri::HTML(file)
    links = doc.css('a').map do |a_tag|
      link = rebuild_url a_tag['href'].to_s
    end 
    links
  end

  def rebuild url
    if url.start_with? 'http'
      url
    else url == "#" || url.start_with? 'java'
      @base_url + url
    end
  end
end
