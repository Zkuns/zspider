class Spider < ActiveRecord::Base
  def initialize url, deep=2
    @url = url
    @deep = deep
    @http = Http.new
    @decoder = Decoder.new url
    @queue = Zqueue.new url, deep
  end

  def run
    loop do
      urls = @queue.shift(5)
      urls.each do |pair|
        puts pair[0]
        urls = crawl(pair)
        @queue.push(urls, pair[1])
      end
      return if @queue.empty?
    end
  end

  def crawl pair
    file = @http.get pair[0]
    links, body = @decoder.parse(file, pair[1])
    Page.create(url: pair[0].to_s, file: body)
    links
  end

end
