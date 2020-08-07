class Dog < ApplicationRecord
    validates :name, presence: true 
    validate :check_name_length

    def check_name_length
        unless self.name.length >= 4 
            errors[:name] << "is too short, must be longer than four or more characters"
        end
    end
end