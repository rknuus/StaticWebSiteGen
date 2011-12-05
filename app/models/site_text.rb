class SiteText < ActiveRecord::Base
  validates :content, :presence => true
end
