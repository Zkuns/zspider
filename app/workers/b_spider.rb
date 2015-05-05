class BSpider
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(url)
    spider = Spider.new url
    spider.run
  end

end
