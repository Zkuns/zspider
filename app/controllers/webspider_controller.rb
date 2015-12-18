class WebspiderController < ApplicationController

  def home

  end

  def search
    BSpider.perform_async('http://'+params[:url])
    redirect_to data_search_path
  end

  def data_search
    size = Page.all.size
    unless params[:key].blank?
      @pages = Page.first(size)
      @pages = martch_link(@pages, params[:key])
    else
      @pages = []
    end
  end

  private
  def martch_link pages, key
    pages.select do |page|
      page && page.file.try(:include?, key)
    end
  end

end
