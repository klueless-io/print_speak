# frozen_string_literal: true

module PrintSpeak
  # Prints the shopping cart contents as a human readable report
  class ShoppingCartReport
    include Rounding

    attr_reader :receipt

    # Initialize the shopping cart from csv data source
    def initialize(csv_file)
      csv = PrintSpeak::CsvReader.new(csv_file)
      items = PrintSpeak::CsvItemMapper.map(csv)
      @receipt = PrintSpeak::Receipt.new(items)
    end

    # rubocop:disable Style/FormatString, Metrics/AbcSize
    def build_report
      # round_to(
      lines = receipt.items.map { |item| "#{item.quantity}, #{item.product}, %.2f" % item.price_with_tax }
      lines << ''
      lines << 'Sales Taxes: %.2f' % round_to(receipt.total_taxes)
      lines << 'Total: %.2f' % round_to(receipt.total_price_with_tax)
      lines.join("\n")
    end
    # rubocop:enable Style/FormatString, Metrics/AbcSize

    def print
      content = build_report

      puts content
    end
  end
end
