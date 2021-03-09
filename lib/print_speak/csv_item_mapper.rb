# frozen_string_literal: true

module PrintSpeak
  # Map items from CSV reader to type safe items
  class CsvItemMapper
    # Convert CSV to array of Hash using opinionated headings (downcase, symbol)
    #
    # example:
    #   [{"Quantity"=>1, "Product"=>"book", "Price"=>12.49}, {"Quantity"=>1, "Product"=>"music cd", "Price"=>14.99}, {"Quantity"=>1, "Product"=>"chocolate bar", "Price"=>0.85}]
    # becomes
    #   [{:quantity=>1, :product=>"book", :price=>12.49}, {:quantity=>1, :product=>"music cd", :price=>14.99}, {:quantity=>1, :product=>"chocolate bar", :price=>0.85}]
    #
    def self.map(csv_reader)
      csv_reader.rows.map do |row|
        opts = csv_reader
               .headings
               .map(&:downcase)
               .map(&:to_sym)
               .zip(row)
               .to_h

        PrintSpeak::CategorizationService.infer_category(opts)
        PrintSpeak::CategorizationService.infer_imported(opts)
        PrintSpeak::Item.new(opts)
      end
    end
  end
end
