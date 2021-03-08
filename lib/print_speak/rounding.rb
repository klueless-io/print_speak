# frozen_string_literal: true

module PrintSpeak
  # Rounding routine to .05 (5 cents) or any other amount, .1 (10 cents)
  module Rounding
    # Round amount to specific amount, defaults to .05
    #
    # example:
    #
    #   round_to(10.22) => 10.20
    #   round_to(10.23) => 10.25
    #   round_to(10.23, to: .1) => 10.20
    def round_to(amount, to: 0.05)
      (amount * (1 / to)).round / (1 / to)
    end
  end
end
