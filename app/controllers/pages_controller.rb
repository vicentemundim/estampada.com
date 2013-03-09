# encoding: UTF-8

class PagesController < ApplicationController
  def index
    load_page(:home)
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
    @message = Message.new
    load_page(:contact)
  end

  private
    def render_page(slug)
      load_page(slug)
      render 'page'
    end

    def load_page(slug)
      @page = Page.from_slug(slug)
    end
end