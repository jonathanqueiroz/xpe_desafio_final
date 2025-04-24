class Client < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
end
