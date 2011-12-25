class Site < ActiveRecord::Base
  validates :name, :template, :presence => true
  
  has_many :site_texts, :dependent => :destroy
  has_many :site_files, :dependent => :destroy
end
