# QuickJS

A gem for distributing [QuickJS](https://bellard.org/quickjs/) via `libquickjs.a` on as common platforms.

## Platforms

 - x86_64-drawin
 - x86_64-linux

## Compiling

For distribution a valid library is required:

```bash
brew install quickjs
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quickrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quickrb

## Usage

```ruby
require 'quickrb'

context = QuickRB::Context.new
context.eval('3 + 4') # 7
context.eval('"Hello" + " " + "World"') # 'Hello World'

context.attach('capitalize', ->(string) { string.capitalize })
QuickRB.eval(context, 'capitalize("hello world")') # 'Hello World'
QuickRB.eval(context, 'capitalize("hello world")', filename: '...') # 'Hello World'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/libquickjs.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
