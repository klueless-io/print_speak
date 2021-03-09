# frozen_string_literal: true

module PrintSpeak
  # Prints the shopping cart contents as a human readable report
  class ShoppingCartReport
    attr_reader :receipt

    # Initialize the shopping cart from csv data source
    def initialize(csv_file)
      csv = PrintSpeak::CsvReader.new(csv_file)
      items = PrintSpeak::CsvItemMapper.map(csv)
      @receipt = PrintSpeak::Receipt.new(items)
    end
  end
end
