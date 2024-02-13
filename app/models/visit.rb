class Visit < ApplicationRecord
  belongs_to :doctor

  validate :no_other_visits_between_beginning_and_ending, :ending_must_be_later_the_beginning, :must_choose_patient

  private

  def no_other_visits_between_beginning_and_ending
    if Visit.where(doctor_id: doctor_id)
            .where.not(id: id) 
            .where("begining <= ? AND ending >= ?", ending, begining)
            .exists?
      errors.add(:base, "There is another visit for this user between the beginning and ending times")
    end
  end

  def ending_must_be_later_the_beginning
    if ending <= begining
      errors.add(:base, "Ending must be later the beginning")
    end
  end

  def must_choose_patient
      if !patient.nil?
        errors.add(:base, "You must choose a patient")
      end
  end
end
