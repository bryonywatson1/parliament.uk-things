class HybridBillDocument
  include ActiveModel::Model
  include ActivePoro::Model

  attr_accessor :petition_id, :filename, :document_data

  validates :petition_id, presence: true
  validates_format_of :filename, presence: true, with: FILE_TYPE_REGEX
  validates :document_data, presence: true

  belongs_to :hybrid_bill_base_submission

end  