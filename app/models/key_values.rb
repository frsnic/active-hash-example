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
