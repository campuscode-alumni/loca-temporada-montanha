class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.save
  end

  private

  def proposal_params
    params.require(:proposal).permit(:start_date, :end_date, :total_amount,
                                    :guest_name, :email, :phone, :rent_purpose,
                                    :pet, :smoker, :details, :property_id)
  end

end