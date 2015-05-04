class Spider < ActiveRecord::Base
  def initialize url, deep=2
    @url = url
    @deep = deep
    @http = Http.new
    @decoder = Decoder.new
    @queue = Queue.new
  end

  def run
    loop do
      urls = @queue.shift(5)
      urls.each do |url|
        puts url
        urls = crawl(url)
        @queue.push(urls)
      end
      return if @queue.empty?
    end
  end

  def crawl url
    file = @http.get url
    links = @decoder.parse(file)
    Page.create(url: url.to_s, file: file)
    links
  end

end
