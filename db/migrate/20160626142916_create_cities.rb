class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string  :name
      t.string  :code
      t.string  :address
      t.integer :country_id
      t.timestamps
    end

    City.create name: 'city1', code: 'city1', address: 'city1_address', country_id: 1
    City.create name: 'city2', code: 'city2', address: 'city2_address', country_id: 2
  end
end
