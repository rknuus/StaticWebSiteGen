class PageText < ActiveRecord::Base
  validates :content, :name, :presence => true
  validates :name, :uniqueness => { :scope => :page_id }
  
  # belongs_to :page
end
