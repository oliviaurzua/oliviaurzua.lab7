class Pet < ApplicationRecord
    belongs_to :owner
    has_many :appointments, dependent: :destroy
    has_one_attached :photo

    before_save -> { name.capitalize! if name.present? }

    scope :by_species, ->(species) { where(species: species) }

    validates :name, :owner, presence: true
    validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
    validates :weight, presence: true, numericality: { greater_than: 0 }
    validates :date_of_birth, presence: true
    validate :date_of_birth_cannot_be_in_the_future
    validate :acceptable_photo

    private

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth.present? && date_of_birth > Date.current
            errors.add(:date_of_birth, "Can´t be in the future")
        end
    end

    def acceptable_photo
        return unless photo.attached?

        unless photo.byte_size <= 5.megabytes
            errors.add(:photo, "is too big (must be 5MB or less)")
        end

        acceptable_types = ["image/jpeg", "image/png", "image/webp"]
        unless acceptable_types.include?(photo.content_type)
            errors.add(:photo, "must be a JPEG, PNG, or WebP")
        end
    end

end