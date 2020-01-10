class InteractionsController < ApplicationController
  before_action :set_interaction, only: %i[show update edit destroy]
  # before_action :set_contact, only: %i[]

  def index
    @interaction = Interaction.all
  end

  def show
  end

  def new
    @interaction = Interaction.new
  end

  def create
    @interaction = Interaction.new(interaction_params)
    @interaction.user = current_user
    @interaction.score = 1
    if @interaction.save
      redirect_to contact_path(@interaction.contact_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @interaction.update(interaction_params)
      redirect_to contact_path(@interaction.contact_id)
    else
      render :edit
    end
  end

  def destroy
    @interaction.destroy
    redirect_to contact_path(@interaction.contact_id)
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_interacion
    @interaction = Interaction.find(params[:id])
  end

  def interaction_params
    params.require(:interaction).permit(:type_id, :note, :score, :contact_id)
  end
end
