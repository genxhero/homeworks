class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    #(e.g., {'1' => ['Joan Lee', 'Charlie McDonald', 'Kevin Quashie'],
    #'2' => ['Ed Michaels', 'Lisa Frank', 'Sharla Alegria']})
    bus_arr = self.buses.includes(:drivers)
    resulting_hash = {}
    #loop hash[buses.id] = driver.name
    bus_arr.each do |el|
        driver_arr = []
        el.drivers.each { |operator| driver_arr << operator.name }
        resulting_hash[bus.id] = driver_arr
     end
    resulting_hash
  end
end
