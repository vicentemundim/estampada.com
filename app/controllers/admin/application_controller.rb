class Admin::ApplicationController < ApplicationController
  layout "admin_application"
  before_filter :authenticate

  private
    def authenticate
      return if Rails.env.development?
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == "estampada" && ENV['ADMIN_SECRET']
      end
    end
end
