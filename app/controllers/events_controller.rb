class EventsController < ApplicationController
  before_action :set_event, only: %i[show update edit destroy]
  before_action :set_contact, only: %i[new create]

  # def index
  #   @event = Event.all
  #   @event = policy_scope(current_user.contacts).order(created_at: :desc)
  # end

  # def show
  #   authorize @event
  # end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user
    @event.contact = @contact
    if @event.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to contact_path(@event.contact_id)
    else
      render :edit
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to contact_path(@event.contact_id)
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:type_id, :note, :contact_id)
  end
end
