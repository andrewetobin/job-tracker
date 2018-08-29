class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.create(contact_params)
    redirect_to company_path(@contact.company)
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:success] = "Your contact #{@contact.full_name}, was successfully deleted!"

    redirect_to company_path(params[:company_id])
  end

  private

    def contact_params
      params.require(:contact).permit(:full_name, :position, :email)
    end
end
