module SqlGui
  ##
  # Returns the path to the views directory.
  #
  # @return [String]
  #
  def self.views
    return File.expand_path('../views', __FILE__)
  end

  ##
  # Returns the path to the given view.
  #
  # @param [String] name
  # @return [String]
  #
  def self.view(name)
    return File.join(views, "#{name}.glade")
  end
end # SqlGui
