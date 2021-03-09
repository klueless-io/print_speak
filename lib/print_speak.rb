# frozen_string_literal: true

require_relative 'print_speak/version'
require_relative 'print_speak/item'
require_relative 'print_speak/receipt'
require_relative 'print_speak/rounding'
require_relative 'print_speak/csv_reader'
require_relative 'print_speak/csv_item_mapper'
require_relative 'print_speak/shopping_cart_report'
require_relative 'print_speak/categorization_service'

module PrintSpeak
  class Error < StandardError; end
  # Your code goes here...
end
