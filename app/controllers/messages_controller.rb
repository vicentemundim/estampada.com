class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])

    if @message.save
      flash[:notice] = t('pages.contact.notice')
      redirect_to contact_path
    else
      flash[:alert] = t('pages.contact.alert')
      @page = Page.from_slug(:contact)
      render 'pages/contact'
    end
  end
end