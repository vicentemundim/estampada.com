class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name, :type => String
  field :email, :type => String
  field :message, :type => String

  validates_presence_of :name, :message, :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  after_create :mail

  private
    def mail
      ContactMailer.contact_email(self).deliver
    end
end