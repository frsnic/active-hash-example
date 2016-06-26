# Rails ActiveHash Example
[![Build Status](https://travis-ci.org/frsnic/active-hash-example.svg?branch=master)](https://travis-ci.org/frsnic/active-hash-example)

## ActiveHash Usage
```ruby
module KeyValues

  class Base < ActiveHash::Base

    def self.options
      all.map { |t| [t.name, t.code] }
    end

  end

  class Country < KeyValues::Base
    self.data = [
      { id: 1, name: "US",     code: "us"     },
      { id: 2, name: "Canada", code: "canada" }
    ]
  end

end

KeyValues::Country.options
# => [["US", "us"], ["Canada", "canada"]]
KeyValues::Country.find_by_code('us')
# => #<KeyValues::Country:0x007f30ec3e0368 @attributes={:id=>1, :name=>"US", :code=>"us"}>
```

ActiveRecord belongs to ActiveHash
```ruby
City.first
# #<City:0x00000005950cb8> {
#            :id => 1,
#          :name => "city1",
#          :code => "city1",
#       :address => "city1_address",
#    :country_id => 1,
#    :created_at => Sun, 26 Jun 2016 14:38:30 UTC +00:00,
#    :updated_at => Sun, 26 Jun 2016 14:38:30 UTC +00:00
# }

City.first.country
# => #<KeyValues::Country:0x0000000260d2c0 @attributes={:id=>1, :name=>"US", :code=>"us"}>
```
ActiveHash belongs to ActiveHash
```ruby
KeyValues::Person.first.country
# => #<KeyValues::Country:0x00000004adaaa8 @attributes={:id=>1, :name=>"US", :code=>"us"}>
KeyValues::Country.first.people
# [
#   [0] #<KeyValues::Person:0x00000005b84138 @attributes={:id=>1, :name=>"Rick", :country_id=>1}>,
#   [1] #<KeyValues::Person:0x00000005b83cd8 @attributes={:id=>3, :name=>"Tina", :country_id=>1}>
# ]

```

## bundler-audit Usage

```ruby
bundle-audit # Only check project's Gemfile.lock
bundle-audit --update # Update the ruby-advisory-db
bundle-audit check --update # Update the ruby-advisory-db and check Gemfile.lock
```

--------------------------
Copyright © 2016 frsnic.
