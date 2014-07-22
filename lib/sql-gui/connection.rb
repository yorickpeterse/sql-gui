module SqlGui
  ##
  # Base class for the various database adapters.
  #
  class Connection
    include Celluloid

    ##
    # Hash containing the registered database adapters.
    #
    def self.registered
      return @registered ||= {}
    end

    ##
    # Registers a new connection adapter.
    #
    # @param [Symbol] name
    #
    def self.register(name)
      Connection.registered[name.to_sym] = self
    end
  end # Connection
end # SqlGui
