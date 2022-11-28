require 'rest-client'

class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @jobs = Job.all
    # raise
  end

  def show
    @job = Job.find(params[:id])

    @application = Apply.new
    if user_signed_in?
      if current_user.jobs.include?(@job)
        flash.alert = "Sua candidatura para essa vaga já foi enviada"
      else
        @application.save!
      end
    end
  end

end
