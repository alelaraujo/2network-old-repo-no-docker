class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update edit destroy]
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @contacts = policy_scope(current_user.contacts).order(created_at: :desc)
  end

  def show
    authorize @contact 
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end
  
  def destroy
    @contact.destroy
    redirect_to contacts_path
  end
  
  private
  
  def set_contact
    # @contact = policy(Contact.find(params[:id])).show?
    @contact = current_user.contacts.find(params[:id])
    # raise
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name)
  end
end
