# Print Speak

> Print Speak basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt

## Getting Started

Run these commands from your shell

```bash
git@github.com:klueless-io/print_speak.git

cd print_speak

bundle install

# run tests and linting from guard watcher
guard

# run test directly from rspec
rspec

# run linting directly from rubocop
rubocop
```

## Stories

### Main Story

As a Small Business Merchant, I want to calculate applicable tax and duties, so I am compliant with government regulations

See all [stories](./STORIES.md)

## Usage

See all [usage examples](./USAGE.md)

### Basic Example

#### Basic example

Description for a basic example to be featured in the main README.MD file

```ruby
class SomeRuby; end
```

### Sample Reports

```bash
----------------------------------------------------------------------
spec/samples/input1.csv
----------------------------------------------------------------------
1, book, 12.49
1, music cd, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.85
----------------------------------------------------------------------
spec/samples/input2.csv
----------------------------------------------------------------------
1, imported box of chocolates, 10.50
1, imported bottle of perfume, 54.62

Sales Taxes: 7.65
Total: 65.15
----------------------------------------------------------------------
spec/samples/input3.csv
----------------------------------------------------------------------
1, imported bottle of perfume, 32.19
1, bottle of perfume, 20.89
1, packet of headache pills, 9.75
1, box of imported chocolates, 11.81

Sales Taxes: 6.65
Total: 74.65
----------------------------------------------------------------------
```

### Unit Tests

```bash
Running all specs

PrintSpeak::Receipt
  .total_price_with_tax
    with local items
      is expected to eq 29.279
  .total_price
    with local items
      is expected to eq 27.83
  .total_taxes
    with local items
      is expected to eq 1.449
  initialize
    no items
      is expected to have attributes {:items => [], :total_price => 0.0}
    with items
      is expected to eq 3

PrintSpeak::CsvItemMapper
  #map
    local and imported products
      is expected to have attributes {:count => 4} and include (have attributes {:category => :general, :imported => true, :price => 27.99, :product => "imported bottle of perfume", :quantity => 1}), (have attributes {:category => :general, :imported => false, :price => 18.99, :product => "bottle of perfume", :quantity => 1}), (have attributes {:category => :medical, :imported => false, :price => 9.75, :product => "packet of headache pills", :quantity => 1}), and (have attributes {:category => :food, :imported => true, :price => 11.25, :product => "box of imported chocolates", :quantity => 1})
    imported products
      is expected to have attributes {:count => 2} and include (have attributes {:category => :food, :imported => true, :price => 10.0, :product => "imported box of chocolates", :quantity => 1}) and (have attributes {:category => :general, :imported => true, :price => 47.5, :product => "imported bottle of perfume", :quantity => 1})
    maps as type safe item
      is expected to be a kind of PrintSpeak::Item
    local products
      is expected to have attributes {:count => 3} and include (have attributes {:category => :book, :imported => false, :price => 12.49, :product => "book", :quantity => 1}), (have attributes {:category => :general, :imported => false, :price => 14.99, :product => "music cd", :quantity => 1}), and (have attributes {:category => :food, :imported => false, :price => 0.85, :product => "chocolate bar", :quantity => 1})

PrintSpeak::Item
  .tax / .price_with_tax
    on imported product (add 10% tax, add 5% duty)
      is expected to have attributes {:price => 100, :price_with_tax => 115.0, :tax => 15.0}
    on local product (add 10% tax)
      is expected to have attributes {:price => 100, :price_with_tax => 110.0, :tax => 10.0}
    on imported tax exempt product (add 5% duty)
      is expected to have attributes {:price => 10, :price_with_tax => 10.5, :tax => 0.5}
    on local tax exempt product (no tax)
      is expected to have attributes {:price => 10, :price_with_tax => 10.0, :tax => 0.0}
  initialize
    with required parameters
      is expected to have attributes {:category => (be nil), :price => 100, :product => "general-product", :quantity => 1}
      and optional parameters
        is expected to have attributes {:category => :xxx, :imported => true, :price => 100, :product => "general-product", :quantity => 1}
      with parameter injection attack
        update read-only fields
          is expected to have attributes {:import_duty => 0, :price => 100, :product => "general-product", :quantity => 1, :sales_tax => 10.0}
        update some internal data
          is expected not to eq "bad actor"
    with invalid options
      .quantity
        is expected to raise PrintSpeak::Error with "Quantity required"
      .product
        is expected to raise PrintSpeak::Error with "Product required"
      .price
        is expected to raise PrintSpeak::Error with "Price required"
    no options
      is expected to raise PrintSpeak::Error
  .sales_tax
    for book
      is expected to eq 0.0
    for general product
      is expected to eq 10.0
    for medical
      is expected to eq 0.0
    for food
      is expected to eq 0.0
  .import_duty
    on local goods
      for food
        is expected to eq 0.0
      for medical
        is expected to eq 0.0
      for product
        is expected to eq 0.0
      for book
        is expected to eq 0.0
    on imported goods
      for product
        is expected to eq 0.0
      for medical
        is expected to eq 0.0
      for food
        is expected to eq 0.0
      for book
        is expected to eq 0.0

PrintSpeak::ShoppingCartReport
  initialize
    is expected not to be nil
  .receipt
    is expected not to be nil

PrintSpeak::Rounding
  #round_to
    to: 0.05 (nearest 5 cents)
      22 cents -> 20 cents
        is expected to eq 0.2
      23 cents -> 25 cents
        is expected to eq 0.25
    to: 0.5 (50 cents)
      77 cents -> $1
        is expected to eq 1
      73 cents -> 50 cents
        is expected to eq 0.5
    to: 0.1 (10 cents)
      25 cents -> 30 cents
        is expected to eq 0.3
      23 cents -> 20 cents
        is expected to eq 0.2

PrintSpeak::CsvReader
  initialize
    file not found
      is expected to raise PrintSpeak::Error with "file not found"
    file found
      is expected not to raise Exception
  check main usage files
    when using file2
      is expected to have attributes {:headings => (have attributes {:count => 3}), :rows => (have attributes {:count => 2})}
    when using file3
      is expected to have attributes {:headings => (have attributes {:count => 3}), :rows => (have attributes {:count => 4})}
  .rows
    is expected to have attributes {:count => 3} and include (include 1, "book", and 12.49), (include 1, "music cd", and 14.99), and (include 1, "chocolate bar", and 0.85)
  .headings
    is expected to have attributes {:count => 3} and eq ["Quantity", "Product", "Price"]

PrintSpeak
  has a standard error
  has a version number

PrintSpeak::CategorizationService
  #infer_imported
    imported products
      for a book
        is expected to be truthy
      for some medical
        is expected to be truthy
      for some food
        is expected to be truthy
    local products
      for some food
        is expected to be falsey
      for some medical
        is expected to be falsey
      for a book
        is expected to be falsey
  #infer_category
    for some medical
      is expected to eq :medical
    for a book
      is expected to eq :book
    for some food
      is expected to eq :food
    for a music cd
      is expected to eq :general
    for some medical variant named headache pills
      is expected to eq :medical
    for some food variant named food_chocolate
      is expected to eq :food

61 examples, 0 failures
```

## Development

Checkout the repo

```bash
git clone klueless-io/print_speak

cd print_speak

bundle install

# run tests and linting from guard watcher
guard

# run test directly from rspec
rspec

# run linting directly from rubocop
rubocop
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klueless-io/print_speak. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Print Speak project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/klueless-io/print_speak/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) David Cruwys. See [MIT License](LICENSE.txt) for further details.
