require 'rails_helper'

RSpec.describe HybridBillBaseSubmission do
  it 'is valid' do
    expect(build(:hybrid_bill_base_submission)).to be_valid
  end

  it 'is invalid' do
    expect(build(:hybrid_bill_base_submission, receive_updates: nil)).not_to be_valid
  end
end
