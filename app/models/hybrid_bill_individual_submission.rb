<<<<<<< HEAD
class HybridBillIndividualSubmission < HybridBillBaseSubmission

	attr_accessor :email, :receive_updates

	validates_with HybridBillIndividualSubmissionValidator

	#EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates_inclusion_of :receive_updates, :in => [true, false]
	validates_presence_of :email, :if => :is_receive_updates_checked?, :message => "email field cannot be blank"

	def is_receive_updates_checked?
		unless !receive_updates
			errors[:email]
		end
	end	
=======
class HybridBillIndividualSubmission

	include ActiveModel::Validations

	validates_with HybridBilllIndividualSubmissionValidator

	attr_accessor :first_name, :last_name, :address_1, :address_2, :postcode, :email, :telephone, :should_be_contacted, :has_agent, :committee_business_id, :is_confidential

	validate :first_name, presence: true
	validate :last_name, presence: true
	validate :address_1, presence: true
	validate :address_2, presence: true
	validate :postcode, presence: true
	validate :email, presence: true
	validate :telephone, presence: true
	# validates :has_agent, inclusion: { in: [true, false] }
	# validates :should_be_contacted, inclusion: { in: [true, false] }
	# validates :committee_business_id, presence: true, :numericality => { :only_integer => true, :equal_to => 255 }

	ATTRIBUTE_MAP = {
		first_name: 'FirstName',
		last_name: 'Surname',
		address_1: 'AddressLine1',
		address_2: 'AddressLine2',
		postcode: 'Postcode',
		email: 'Email',
		telephone: 'Telephone',
		should_be_contacted: 'ShouldBeContacted',
		has_agent: 'HasAgent',
		committee_business_id: 'CommitteeBusinessId'
	}
>>>>>>> WIP Validator work
end