class SiteTextDispatcher
  def initialize(site)
    @site = site
  end
  
  def method_missing(method, *args)
    #FIXME: throw error if name not found
    SiteText.find_by_name_and_site_id(method, @site.id).content
  end

  def respond_to?(method)
    !SiteText.find_by_name_and_site_id(method, @site.id).nil?
  end
end

class SiteFileDispatcher
  def initialize(site)
    @site = site
  end
  
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    SiteFile.find_by_name_and_site_id(method, @site.id).path
  end
  def respond_to?(method)
    logger.info "You checked: #{self.class.to_s}.#{method}"
    !SiteFile.find_by_name_and_site_id(method, @site.id).nil?
  end
end

class Site < ActiveRecord::Base
  validates :name, :template, :presence => true
  
  has_many :site_texts, :dependent => :destroy
  has_many :site_files, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  
  def texts
    SiteTextDispatcher.new(self)
  end
  
  def files
    SiteFileDispatcher.new(self)
  end
end
