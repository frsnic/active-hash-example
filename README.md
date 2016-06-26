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

--------------------------

## bundler-audit Usage

```ruby
bundle-audit # Only check project's Gemfile.lock
bundle-audit --update # Update the ruby-advisory-db
bundle-audit check --update # Update the ruby-advisory-db and check Gemfile.lock
```

--------------------------
Copyright © 2016 frsnic.
