class SiteFile < ActiveRecord::Base
  validates :path, :name, :presence => true
  validates :name, :uniqueness => true
end
