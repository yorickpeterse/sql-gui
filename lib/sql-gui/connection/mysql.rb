module SqlGui
  class Connection
    class MySQL < Connection
      register :mysql

      def initialize(host, user, password, database)
        require 'mysql2'

        @connection = Mysql2::Client.new(
          :host     => host,
          :username => user,
          :password => password,
          :database => database
        )
      end

      def execute(sql)
        result = @connection.query(sql)

        return QueryResult.new(result.fields, result.to_a)
      end
    end # MySQL
  end # Connection
end # SqlGui
