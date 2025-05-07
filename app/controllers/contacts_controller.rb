# frozen_string_literal: true

class ContactsController < ApplicationController
  def create
    @contact = ContactForm.new(contact_params)
    @contact.request = request

    if @contact.deliver
      flash[:success] = 'Message sent!'
    else
      flash[:error] = 'Could not send message'
    end

    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end