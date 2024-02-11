class Visit < ApplicationRecord
  belongs_to :user

  validate :no_other_visits_between_beginning_and_ending

  private

  def no_other_visits_between_beginning_and_ending
    if Visit.where(user_id: user_id)
            .where.not(id: id) # exclude current visit if updating
            .where("begining <= ? AND ending >= ?", ending, begining)
            .exists?
      errors.add(:base, "There is another visit for this user between the beginning and ending times")
    end
  end
end
