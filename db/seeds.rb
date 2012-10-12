# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_page_with(slug, sections)
  snippets_attributes = sections.map do |section|
    {section: section.to_sym, body: ''}
  end

  Page.create slug: slug, snippets_attributes: snippets_attributes
end

Page.delete_all

#### Home Page
create_page_with(:home, [:main])

#### Photos Page
create_page_with(:photos, [:main])

#### Contact Page
create_page_with(:contact, [:main])
