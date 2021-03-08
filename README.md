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

## Development

Checkout the repo

```bash
git clone klueless-io/print_speak
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

```bash
bin/console

Aaa::Bbb::Program.execute()
# => ""
```

`print_speak` is setup with Guard, run `guard`, this will watch development file changes and run tests automatically, if successful, it will then run rubocop for style quality.

To release a new version, update the version number in `version.rb`, build the gem and push the `.gem` file to [rubygems.org](https://rubygems.org).

```bash
gem build
gem push rspec-usecases-?.?.??.gem
# or push the latest gem
ls *.gem | sort -r | head -1 | xargs gem push
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klueless-io/print_speak. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Print Speak project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/klueless-io/print_speak/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) David Cruwys. See [MIT License](LICENSE.txt) for further details.
