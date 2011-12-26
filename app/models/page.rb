class Page < ActiveRecord::Base
  validates :content, :name, :presence => true
  validates :name, :uniqueness => { :scope => :site_id }

  belongs_to :site
  has_many :page_texts
  has_many :page_files
end
