require 'rest-client'

class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  
  def index
    index_response = RestClient.get 'https://prod.api.sinaxys.com/v2/jobs'
    @openings = JSON.parse(index_response)
    total = @openings.count
    @jobs = []

    @openings.first(total).each do |opening|
      @id = opening['id']
      show_response = RestClient.get "https://prod.api.sinaxys.com/v2/jobs/#{@id}"
      @opening = JSON.parse(show_response)
      @description = @opening['description']

      @jobs << Job.create(
        # id: opening['id'],
        specialty: opening['specialty'],
        value: opening['value'],
        value_period: opening['value_period'],
        description: @description,
        clinic_name: opening['clinic']['name'],
        clinic_city: opening['clinic']['city'],
        clinic_state: opening['clinic']['state']
      )
    end
    # raise
  end

  def show
    @job = Job.find(params[:id])
  end
end
