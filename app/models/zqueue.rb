class Zqueue < ActiveRecord::Base
  def initialize url, deep
    @queue = [[url, deep]]
    @history = [url]
    @base_url = url
  end

  def shift num
    @queue.shift(num)
  end

  def push urls, deep
    urls.each do |url|
      unless check url
        @history.push(url)
        @queue.push([url, deep-1])
      end
    end
  end

  def check url
    @history.include? url
  end

  def empty?
    @queue.size == 0
  end
end
