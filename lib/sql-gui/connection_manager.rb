module SqlGui
  module ConnectionManager
    ##
    # @return [Hash]
    #
    def self.active
      return @active ||= {}
    end

    ##
    # Returns a new connection ID.
    #
    # @return [Fixnum]
    #
    def self.new_connection_id
      @connection_id ||= 0

      return @connection_id += 1
    end

    ##
    # @param [Symbol] type
    # @param [Array] args
    #
    def self.connect(type, *args)
      active[new_connection_id] = Connection.registered[type].new(*args)
    end

    ##
    # Schedules a new query for execution.
    #
    # @param [Fixnum] connection_id
    # @param [String] query
    # @return [Celluloid::Future]
    #
    def self.schedule(connection_id, query)
      return active[connection_id].future.execute(query)
    end
  end # ConnectionManager
end # SqlGui
