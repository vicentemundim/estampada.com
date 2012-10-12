class Snippet
  include Mongoid::Document

  field :section
  field :status, :type => Boolean, :default => true
  field :order, :default => 0
  field :body

  has_many :photos, :as => :imageable

  embedded_in :page

  validates_presence_of :section
  validates_uniqueness_of :section

  attr_accessible :section, :status, :order, :body, :photos_attributes

  scope :ordered, order_by(:order.asc)

  def rendered_body
    RedCloth.new(body).to_html
  end

  class << self
    def section(value)
      where(:section => value).first
    end
  end
end