# Ubw::Client

A Ruby client for the UBW REST API. Note that the API is currently readonly.

The goal of this gem is to provide a Ruby-ish wrapper for the UBW API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ubw-client', '~> 0.1', git: 'https://github.com/sanger/ubw-client.git'
```

And then execute:

    $ bundle

## Usage

Configuration example:

```ruby
# The site must be set before using the gem, as it is the base URL for all API calls.
#
# By default ENV['UBW_SITE'] is used but it can be set like so
Ubw::Client.site = 'https://ubw.sanger.ac.uk' 

# A Faraday::Connection can be obtained and configured before use (perhaps to disable a proxy)
Ubw::Client.connection do |connection|
  connection.proxy {}
  connection.use SomeCustomMiddleware
end
```

Getting started:

```ruby
# Fetch a SubProject
Ubw::SubProject.find('S0001-001')
# => #<Ubw::SubProject sub_cost_code="S0001-001", cost_code="S0001", status="N", is_active?=true>

# Fetch all SubProjects
Ubw::SubProject.all
# => #<Ubw::ResultSet:0x000032fd23ad42 @result_count=10, @items=[#<Ubw::SubProject sub_cost_code="S0001-001", cost_code="S0001", status="N", is_active?=true>, ...]

# Find all Prices where module_name is 'WGS' or 'Library Prep' and cost_code is 'S0001'
# Note that the values here can either be a String or an Array
Ubw::Price.where(module_name: ['WGS', 'Library Prep'], cost_code: 'S0001')
# => #<Ubw::ResultSet:0x0001972ae1df28 @result_count=2, @items=[#<Ubw::Price module_name="WGS", cost_code="S0001", unit_price="9.99">, ...]
```

### Resources

There are currently only two resources: `Ubw::SubProject` and `Ubw::Price`.

`Ubw::SubProject` can be looked up by `sub_cost_code` e.g. `Ubw::SubProject.find(sub_cost_code)`

Both also include `where` and `all` class methods.

### Ubw::ResultSet

Result Sets represent a collection of resources e.g. a list of `Ubw::Price`s. `#result_count` will give the size of the collection:

```ruby
Ubw::Price.where(module_name: 'WGS').result_count
# => 3
```

They are also [enumerable](https://ruby-doc.org/core-2.5.1/Enumerable.html), allowing you iterate through `#items`. e.g.
```ruby
# Are there any SubProjects that have cost_codes that don't start with 'S'?
Ubw::SubProject.all.any? { |sub_project| sub_project.cost_code[0] != 'S' }
# => false
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
