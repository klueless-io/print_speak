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

      @headings = csv[0]

      @rows = csv[1..-1].reject(&:empty?)
    end
  end
end
