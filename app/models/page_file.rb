class PageFile < ActiveRecord::Base
  validates :path, :name, :presence => true
  validates :name, :uniqueness => { :scope => :page_id }
  
  belongs_to :page
end
