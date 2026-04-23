class Owner < ApplicationRecord
    has_many :pets, dependent: :destroy 

    before_validation -> { email.strip.downcase! if email.present? }
    
    validates :first_name, :last_name, :phone, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end