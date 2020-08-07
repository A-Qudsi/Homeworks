class House < ApplicationRecord

    has_many :dogs, 
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Dog 
    
    def toys 
        toys = []

        dogs.each do |dog|
            toys.concat(dogs.toys)
        end
        toys
    end
end
