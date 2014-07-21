module SqlGui
  module Connection
    ##
    # Yes, a base class. Deal with it.
    #
    class Base
      include Celluloid

      def self.register(name)
        Connection.registered[name] = self
      end
    end # Base
  end # Connection
end # SqlGui
