# frozen_string_literal: true

module PrintSpeak
  # Represents a receipt wit list of items
  #
  # When I purchase items I receive a receipt that lists
  # the name of all the items and their price (including tax),
  # finishing with the total cost of the items, and the total
  # amounts of sales taxes paid.
  #
  # The rounding rules for sales tax are that for a tax rate of n%,
  # a shelf price of p contains (np/100 rounded up to the nearest 0.05)
  # amount of sales tax.
  class Receipt
    attr_reader :items

    def initialize(items)
      @items = items
    end

    def total_price
      @total_price ||= items.sum(&:price)
    end

    def total_taxes
      @total_taxes ||= items.sum(&:tax)
    end

    def total_price_with_tax
      @total_price_with_tax ||= items.sum(&:price_with_tax)
    end

    # 1, book, 12.49
    # 1, music CD, 16.49
    # 1, chocolate bar, 0.85

    # Sales Taxes: 1.50
    # Total: 29.83
  end
end
