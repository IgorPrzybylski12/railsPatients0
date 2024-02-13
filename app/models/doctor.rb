class Doctor < ApplicationRecord
    has_many :visits

    def full_name
        "#{first_name} #{last_name}"
      end
end
