class ApplysController < ApplicationController

  def create
    if user_signed_in?
      @application = Apply.new
      if @application.new_record?
        @application.save
      else
        flash.alert = "Sua candidatura para essa vaga já foi enviada"
      end
    else
      redirect_to new_user_registration_path
    end
    # raise
  end

  def show
    create
    @application
  end
end
