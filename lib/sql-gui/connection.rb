module SqlGui
  module Connection
    def self.registered
      return @registered ||= {}
    end

    ##
    # @return [Hash]
    #
    def self.active
      return @active ||= {}
    end

    def self.new_connection_id
      @connection_id ||= 0

      return @connection_id += 1
    end

    ##
    # @param [Symbol] type
    # @param [Array] args
    #
    def self.connect(type, *args)
      active[new_connection_id] = registered[type].new(*args)
    end

    def self.schedule(connection_id, query)
      return active[connection_id].future.execute(query)
    end
  end # Connection
end # SqlGui
