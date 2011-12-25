class SiteText < ActiveRecord::Base
  validates :content, :name, :presence => true
  validates :name, :uniqueness => { :scope => :site_id }
  
  belongs_to :site
end
