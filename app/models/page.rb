class Page
  include Mongoid::Document

  field :slug
  field :order, default: 1

  embeds_many :snippets

  has_many :photos, :as => :imageable

  accepts_nested_attributes_for :snippets

  attr_accessible :slug, :snippets_attributes

  validates_presence_of :slug
  validates_uniqueness_of :slug

  default_scope asc(:order)

  class << self
    def from_slug(slug)
      where(:slug => slug).first
    end
  end
end