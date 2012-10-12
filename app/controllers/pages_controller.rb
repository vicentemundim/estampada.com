# encoding: UTF-8

class PagesController < ApplicationController
  def index
    @page = Page.from_slug(:home)
  end

  def photos
    @page = Page.from_slug(:photos)
  end

  def contact
    @page = Page.from_slug(:contact)
  end
end