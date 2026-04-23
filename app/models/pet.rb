class Pet < ApplicationRecord
    belongs_to :owner
    has_many :appointments, dependent: :destroy

    before_save -> { name.capitalize! if name.present? }

    validates :name, :owner, presence: true
    validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
    validates :weight, presence: true, numericality: { greater_than: 0 }
    validates :date_of_birth, presence: true

    validate :date_of_birth_cannot_be_in_the_future

    private

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth.present? && date_of_birth > Date.current
            errors.add(:date_of_birth, "Can´t be in the future")
        end
    end

    scope :by_species, ->(species) { where(species: species) }
end