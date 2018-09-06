class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end
    seeds
  end

  def better_seeds_query
    #  #<Seed:0x00007f835e21caf8 #id: 39, count: 27, plant_id: 4
    #so need id, count, and plant_id
    plants = self.plants.includes(:seeds)
    seeds = []
    plants.each {|plant| seeds << plant.seeds}
    seeds
  end
end
