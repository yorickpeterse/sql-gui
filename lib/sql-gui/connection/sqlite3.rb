module SqlGui
  class Connection
    class SQLite3 < Connection
      register :sqlite3

      def initialize(database)
        require 'sqlite3'

        @connection = ::SQLite3::Database.new(
          database,
          :results_as_hash => true
        )
      end

      def execute(sql)
        columns, *rows = @connection.execute2(sql)

        return QueryResult.new(columns, rows)
      end
    end # SQLite3
  end # Connection
end # SqlGui
