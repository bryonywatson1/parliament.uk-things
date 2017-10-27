require 'rails_helper'

RSpec.describe HybridBillDocument do

	  it 'is valid' do 
	  	expect(build(:hybrid_bill_document)).to be_valid
	  end	

	  it 'is invalid' do
	    expect(build(:hybrid_bill_document, filename: 'test.tiff')).not_to be_valid
	  end

	context 'decoding' do   

	  it 'is ok' do
	  	hybrid_bill_document = build(:hybrid_bill_document)
	    expect(Base64.decode64(hybrid_bill_document.document_data)).to eq("This is a test string")
	  end

	end  
end
