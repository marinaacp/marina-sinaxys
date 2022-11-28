class ApplysController < ApplicationController

  def create
    if user_signed_in?
      job = 
      @application = Apply.new
      if Apply.where(user_id: current_user.id, job_id: Job.find(job).id).exists?
        flash.alert = "Sua candidatura para essa vaga já foi enviada"
      else
        @application.save
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
