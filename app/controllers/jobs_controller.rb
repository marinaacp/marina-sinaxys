require 'rest-client'

class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @jobs = Job.all
    # raise
  end

  def show
    @job = Job.find(params[:id])
  end
end
