class SiteText < ActiveRecord::Base
  validates :content, :name, :presence => true
  validates :name, :uniqueness => true
  
  belongs_to :site
end
