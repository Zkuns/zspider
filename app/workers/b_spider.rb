class BSpider
  include Sidekiq::Worker

  def perform(url)
    spider = Spider.new url
    spider.run
  end
end
