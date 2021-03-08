# frozen_string_literal: true

module PrintSpeak
  # Represents a purchase item on a receipt
  class Item
    attr_accessor :quantity, :product, :price
  end
end
