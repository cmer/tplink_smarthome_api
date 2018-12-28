# Tp-Link SmartHome API for Ruby

Just a stupid simple library that interacts with the great `tplink-smarthome-api` npm package.

Control your Tp-Link smart plugs via Ruby.

## Installation

Install the Node.js package dependency:

```
npm install -g tplink-smarthome-api
```

Add this line to your application's Gemfile:

```ruby
gem 'tplink_smarthome_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tplink_smarthome_api

## Usage

```ruby
device = TplinkSmarthomeApi('10.0.0.65', verbose: true)
device.power_on

device.power_off(delay: 10) # waits 10 seconds before powering the device off

# or chain methods together
device.power_off.power_on(delay: 15) # turn off device, wait 15 seconds, then turn device back on

# reboot
device.reboot
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cmer/tplink_smarthome_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TplinkSmarthomeApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cmer/tplink_smarthome_api/blob/master/CODE_OF_CONDUCT.md).
