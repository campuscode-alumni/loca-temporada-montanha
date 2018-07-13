class ProposalController < ApplicationController

  def new
    @proposal = Proposal.new
    @property = Property.find(params[:property_id])
  end

end