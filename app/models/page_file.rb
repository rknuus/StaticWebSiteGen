class PageFile < ActiveRecord::Base
  validates :name, :path, :source_path, :presence => true
  validates :name, :uniqueness => { :scope => :page_id }
  
  belongs_to :page
end
