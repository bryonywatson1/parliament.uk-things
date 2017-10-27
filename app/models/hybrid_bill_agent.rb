class HybridBillAgent
  include ActiveModel::Model
  include ActivePoro::Model

  attr_accessor :first_name, :surname, :address_1, :address_2, :postcode, :country, :email, :telephone, :receive_updates

  #EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :surname, presence: true
  validates :address_1, presence: true
  validates_format_of :email, presence: true, with: EMAIL_REGEX
  validates :telephone, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :receive_updates, inclusion: { in: [true, false] }

  belongs_to :hybrid_bill_base_submission
end
