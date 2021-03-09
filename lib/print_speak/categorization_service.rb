# frozen_string_literal: true

require 'csv'

module PrintSpeak
  # Applies meta data such as :category and :imported to items
  #
  # This works with raw data, so the incoming opts
  class CategorizationService
    def self.infer_category(opts)
      opts[:category] = case opts[:product]
                        when /book/i
                          :book
                        when /food|chocolate/i
                          :food
                        when /medical|headache/i
                          :medical
                        else
                          :general
                        end
    end

    def self.infer_imported(opts)
      opts[:imported] = /imported/i.match?(opts[:product])
    end
  end
end
