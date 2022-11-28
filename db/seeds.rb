# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
index_response = RestClient.get 'https://prod.api.sinaxys.com/v2/jobs'
@openings = JSON.parse(index_response)
@total = @openings.count
@jobs = []
@openings.first(@total).each do |opening|
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
