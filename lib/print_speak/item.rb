# frozen_string_literal: true

module PrintSpeak
  # Represents a purchase item on a receipt
  class Item
    attr_accessor :quantity, :product, :price, :category, :imported

    def initialize(**opts)
      # Simulate strong_params
      opts = opts.slice(:quantity, :product, :price, :category, :imported)

      # Set attributes
      opts.each { |k, v| instance_variable_set("@#{k}", v) }

      # mutable and raise if not set correctly
      guards
    end

    def guards
      raise PrintSpeak::Error, 'Quantity required' if quantity.nil? || !quantity.is_a?(Integer)
      raise PrintSpeak::Error, 'Price required' if price.nil? || !(price.is_a?(Integer) || price.is_a?(Float))
      raise PrintSpeak::Error, 'Product required' if product.nil?
    end
  end
end
