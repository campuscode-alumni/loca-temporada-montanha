class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show]

  def show;  end

  def index
    @proposals = []

    if user_signed_in? 
      @proposals = current_user.proposals
    elsif realtor_signed_in?
      @proposals = current_user.proposals
    end

  end

  def new
    @proposal = Proposal.new
    @property = Property.find(params[:property_id])
  end

  def create
    @property = Property.find(params[:property_id])
    @proposal = Proposal.new(proposal_params)

    @proposal.property = @property
    @proposal.user = current_user

    if @proposal.save
      flash[:success] = 'Proposta enviada com sucesso'
      redirect_to [@property, @proposal]
    else
      flash[:alert] = 'Falta preencher campos'
      render :new 
    end
    
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:start_date, :end_date, :total_amount, 
                                     :total_guests, :guest_name, :email, :phone, 
                                     :pet, :smoker, :details, :property, 
                                     :rent_purpose)
  
  end

end