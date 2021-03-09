# frozen_string_literal: true

module PrintSpeak
  # Represents a purchase item on a receipt
  class Item
    # include PrintSpeak::Rounding

    attr_accessor :quantity, :product, :price, :category, :imported

    # virtual attributes
    attr_reader :sales_tax, :import_duty

    def initialize(**opts)
      # Simulate strong_params
      opts = opts.slice(:quantity, :product, :price, :category, :imported)

      # Set attributes
      opts.each { |k, v| instance_variable_set("@#{k}", v) }

      # mutable and raise if not set correctly
      guards

      calculate_sales_tax
      calculate_import_duty
    end

    def tax
      @tax ||= sales_tax + import_duty
    end

    def price_with_tax
      @price_with_tax ||= price + sales_tax + import_duty
    end

    # rubocop:disable Metrics/AbcSize
    def debug
      # "#{quantity}, #{product}, #{price_with_tax.round(2)}, #{sales_tax.round(2)}, #{import_duty.round(2)}, #{category}, #{imported}"}
      l
      kv('quantity', quantity)
      kv('product', product)
      kv('price', price)
      kv('category', category)
      kv('imported', imported)
      l
      kv('sales_tax', sales_tax)
      kv('import_duty', import_duty)
      l
      kv('tax', tax)
      kv('price_with_tax', price_with_tax)
    end
    # rubocop:enable Metrics/AbcSize

    private

    def kv(key, value)
      puts "#{key.ljust(15)} : #{value}"
    end

    def l
      puts '-' * 70
    end

    # rubocop:disable Metrics/AbcSize
    def guards
      raise PrintSpeak::Error, 'Quantity required' if quantity.nil? || !quantity.is_a?(Integer)
      raise PrintSpeak::Error, 'Price required' if price.nil? || !(price.is_a?(Integer) || price.is_a?(Float))
      raise PrintSpeak::Error, 'Product required' if product.nil?
    end
    # rubocop:enable Metrics/AbcSize

    # Basic sales tax is applicable at a rate of 10% on all goods
    #   except books, food, and medical products that are exempt.
    def calculate_sales_tax
      @sales_tax = 0
      @sales_tax = (price * 0.1) unless %i[book food medical].include?(category)
    end

    # Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.
    def calculate_import_duty
      @import_duty = imported ? (price * 0.05) : 0.0
    end
  end
end
