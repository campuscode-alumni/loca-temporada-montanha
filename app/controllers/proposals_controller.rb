class ProposalsController < ApplicationController
  def index
   @proposals = ['teste', 'Nenhuma proposta para este imóvel no momento']
  end
end