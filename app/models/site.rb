class Site < ActiveRecord::Base
  validates :name, :template, :presence => true
end
