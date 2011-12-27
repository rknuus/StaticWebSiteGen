class PageTextDispatcher
  def initialize(page)
    @page = page
  end
  
  def method_missing(method, *args)
    #FIXME: throw error if name not found
    PageText.find_by_name_and_page_id(method, @page.id).content
  end
  
  def respond_to?(method)
    !PageText.find_by_name_and_page_id(method, @page.id).nil?
  end
end

class PageFileDispatcher
  def initialize(page)
    @page = page
  end
  
  def method_missing(method, *args)
    PageFile.find_by_name_and_page_id(method, @page.id).path
  end

  def respond_to?(method)
    !PageFile.find_by_name_and_page_id(method, @page.id).nil?
  end
end

class Page < ActiveRecord::Base
  validates :content, :name, :presence => true
  validates :name, :uniqueness => { :scope => :site_id }

  belongs_to :site
  has_many :page_texts
  has_many :page_files
  
  def texts
    PageTextDispatcher.new(self)
  end
  
  def files
    PageFileDispatcher.new(self)
  end
end
