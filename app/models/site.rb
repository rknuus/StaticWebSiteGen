class Site < ActiveRecord::Base
  validates :name, :template, :presence => true
  
  has_many :site_texts, :dependent => :destroy
end
