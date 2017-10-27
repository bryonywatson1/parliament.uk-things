class HybridBillBaseSubmission
  include ActiveModel::Model
  include ActivePoro::Model

  attr_accessor :on_behalf_of, :first_name, :surname, :address_1, :address_2, :postcode, :country, :email, :telephone, :receive_updates

  validates :first_name, presence: true
  validates :surname, presence: true
  validates :address_1, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :receive_updates, inclusion: { in: [true, false] }

  has_one :hybrid_bill_agent
  
end
