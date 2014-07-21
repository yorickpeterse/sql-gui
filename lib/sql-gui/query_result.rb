module SqlGui
  ##
  # The QueryResult class contains the result of a SQL query along with some
  # extra metadata such as the column names.
  #
  # @!attribute [r] columns
  #  @return [Array]
  #
  # @!attribute [r] rows
  #  @return [Array]
  #
  class QueryResult
    attr_reader :columns, :rows

    def initialize(columns, rows)
      @columns = columns
      @rows    = rows
    end
  end # QueryResult
end # SqlGui
