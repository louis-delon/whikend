class ContactController < ApplicationController

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    @contact.save
    UserMailer.contact(@contact).deliver_now
    redirect_to root_path
  end

private

  def contact_params
    params
      .require(:contact)
      .permit(
        :content,
        :email,
      )
  end

end
