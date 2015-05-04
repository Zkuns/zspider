class WebspiderController < ApplicationController

  def home
    
  end

  def search
    spider = Spider.new params[:url]
    spider.run
  end
end
