class MissingError < RuntimeError
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

module ApplicationHelper
  def get_textarea_size
    '120x45'
  end
  
  def get_pathfield_size
    80
  end
end
