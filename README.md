# Pomodo

Simple pomodoro CLI tool with Luxafor Flag support

## Installation

`brew tap prrrnd/pomodo`
`brew install pomodo`

## Usage

```sh
# Set up the Webhook ID from Luxafor
pomodo init <LUXAFOR_ID>

# Start a pomodoro of 25 min with 5 min break
pomodo start

# Start a pomodoro of 60 min with 10 min break
pomodo start 60 10
```

The Luxafor Flag is automatically updated from red to green to red.
A macOS notification pops up to remind you to take a break.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/prrrnd/pomodo.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
