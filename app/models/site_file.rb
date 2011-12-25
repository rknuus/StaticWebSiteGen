class SiteFile < ActiveRecord::Base
  validates :path, :name, :presence => true
  validates :name, :uniqueness => { :scope => :site_id }
  
  belongs_to :site
end
