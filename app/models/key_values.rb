module KeyValues

  class Base < ActiveHash::Base

    def self.options
      all.map { |t| [t.name, t.code] }
    end

  end

  class Country < KeyValues::Base
    include ActiveHash::Associations
    has_many :people, class_name: 'KeyValues::Person'

    self.data = [
      { id: 1, name: "US",     code: "us"     },
      { id: 2, name: "Canada", code: "canada" }
    ]
  end

  class Person < ActiveHash::Base
    include ActiveHash::Associations
    belongs_to :country, class_name: 'KeyValues::Country'

    self.data = [
      { id: 1, name: "Rick", country_id: 1 },
      { id: 2, name: "Anna", country_id: 2 },
      { id: 3, name: "Tina", country_id: 1 },
    ]
  end

end
