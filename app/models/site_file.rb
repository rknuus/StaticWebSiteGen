class SiteFile < ActiveRecord::Base
  validates :name, :path, :source_path, :presence => true
  validates :name, :uniqueness => { :scope => :site_id }
  
  belongs_to :site
end
