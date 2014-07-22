module SqlGui
  module Connection
    ##
    #
    class PostgreSQL < Base
      register :postgresql

      def initialize(host, user, password, database)
        require 'pg'

        @connection = PG.connect(
          :host     => host,
          :user     => user,
          :password => password,
          :dbname   => database
        )
      end

      def execute(sql)
        result = @connection.exec(sql)

        return QueryResult.new(result.fields, result.to_a)
      end
    end # PostgreSQL
  end # Connection
end # SqlGui
