class ApplysController < ApplicationController

  def create
    if user_signed_in?
      @application = Application.new
      if @application.new_record?
        @application.save
      else
        flash.alert = "Sua candidatura para essa vaga já foi enviada"
      end
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    create
    @application = Apply.find(params[:id])
  end
end
