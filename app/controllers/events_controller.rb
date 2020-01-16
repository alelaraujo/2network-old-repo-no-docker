class EventsController < ApplicationController
  before_action :set_event, only: %i[show update edit destroy]
  before_action :set_contact, only: %i[new create edit update]

  def show
    authorize @event
  end

  def new
    authorize @event = Event.new
  end

  def create
    authorize @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.contact = @contact
    if @event.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
    authorize @contact = @event.contact
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
    authorize @event.destroy
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
