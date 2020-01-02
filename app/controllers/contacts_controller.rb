class ContactsController < ApplicationController
  before_action :contact_params, only: [:new]
  # before_action :set_place, only: [:show]
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :address)
  end
end
