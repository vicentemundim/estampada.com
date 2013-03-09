# encoding: UTF-8

class PagesController < ApplicationController
  def index
    @page = Page.from_slug(:home)
  end

  def us
    render_page(:us)
  end

  def products
    render_page(:products)
  end

  def orders
    render_page(:orders)
  end

  def shop
    render_page(:shop)
  end

  def contact
    render_page(:contact)
  end

  private
    def render_page(slug)
      @page = Page.from_slug(slug)
      render 'page'
    end
end