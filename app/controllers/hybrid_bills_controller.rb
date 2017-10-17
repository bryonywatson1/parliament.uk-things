
#require_relative '../lib/hybrid_bills'

require 'pry'
require 'pry-nav'

class HybridBillsController < ApplicationController
  include HybridBillsHelper

  STEP_TEMPLATES = {
    'submission-type': 'hybrid_bills/steps/1',
    'covering-page': {
      'individual': 'hybrid_bills/steps/individual/1',
      'organisation': 'hybrid_bills/steps/organisation/1',
      'group': 'hybrid_bills/steps/group/1'
    },
    'document-submission': 'hybrid_bills/steps/3',
    'terms-conditions': 'hybrid_bills/steps/4',
    'complete': 'hybrid_bills/steps/5'
  }

  def index
  end

  # show route added to enable testing of Dummy application routing
  def show
  	raise ActionController::RoutingError, 'invalid petition id' unless validate_petition(params[:bill_id])

  	@petition = params[:bill_id]
    @hybrid_bill = HybridBill.new

    @hybrid_bill = HybridBill.new


    if params[:step]
      template = STEP_TEMPLATES[params[:step].to_sym]
      template = template[params[:type].to_sym] if params[:type]

      return render template if template
    end

  private

  def validate_petition(id)
  	id == 'hs2'
  end
end

