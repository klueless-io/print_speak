# frozen_string_literal: true

require_relative 'lib/print_speak/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version  = '>= 2.5'
  spec.name                   = 'print_speak'
  spec.version                = PrintSpeak::VERSION
  spec.authors                = ['David Cruwys']
  spec.email                  = ['david@ideasmen.com.au']

  spec.summary                = 'Print Speak basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt'
  spec.description            = <<-TEXT
    Print Speak basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt
  TEXT
  spec.homepage               = 'http://appydave.com'
  spec.license                = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  # spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/klueless-io/print_speak'
  spec.metadata['changelog_uri'] = 'https://github.com/klueless-io/print_speak/commits/master'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the RubyGem files that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  # spec.extensions    = ['ext/print_speak/extconf.rb']

  # spec.add_dependency 'tty-box',         '~> 0.5.0'
end
