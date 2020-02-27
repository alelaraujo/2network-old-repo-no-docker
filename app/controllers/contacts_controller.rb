# require 'pry-byebug'
class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update edit destroy]
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @contacts = policy_scope(current_user.contacts).order(created_at: :desc)
    if params[:query].present?
      @contacts = @contacts.search_by_first_name_and_last_name(params[:query])
    else
      @contacts
    end
  end

  def show
    authorize @contact 
    @events = @contact.events
  end
  
  def new
    authorize @contact = Contact.new
  end
  
  def create
    authorize @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end
  
  def edit
    authorize @contact
  end
  
  def update
    authorize @contact
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end
  
  def destroy
    authorize @contact.destroy
    redirect_to contacts_path
  end
  
  private
  
  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :bio, :frequency, :photo)
  end
end