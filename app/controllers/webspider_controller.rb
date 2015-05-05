class WebspiderController < ApplicationController

  def home
    
  end

  def search
    BSpider.perform_async(params[:url])
    render :home
  end

end
