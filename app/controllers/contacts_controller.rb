class ContactsController < ApplicationController
  before_action contact_params[only :new]
  def create

  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :address)
  end
end
