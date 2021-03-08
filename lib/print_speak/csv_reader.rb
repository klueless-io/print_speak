# frozen_string_literal: true

require 'csv'

module PrintSpeak
  # Read CSV file and split into headings and rows
  class CsvReader
    attr_reader :headings
    attr_reader :rows

    def initialize(file)
      raise PrintSpeak::Error, 'file not found' unless File.exist?(file)

      csv = CSV.read(file, converters: :numeric)

      # remove padding on each heading
      @headings = csv[0].map(&:strip)

      # remove + empty rows and then remove padding on each cell of each row
      @rows = csv[1..-1].reject(&:empty?).map { |row| row.map { |column| column.is_a?(String) ? column.strip : column } }
    end
  end
end
