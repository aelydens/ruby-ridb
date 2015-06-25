class Facility
  attr_reader :email, :longitude, :last_updated_by, :description, :latitude, :type_description,
  :phone, :map_url, :reservation_url, :directions, :name, :keywords, :fee, :stay_limit,
  :last_updated_date, :is_accessible, :id

  def initialize(data)
    @email = data['FacilityEmail']
    @longitude = data['FacilityLongitude']
    @last_updated_by = data['LastUpdatedBy']
    @description = data['FacilityDescription']
    @latitude = data['FacilityLatitude']
    @type_description = data['FacilityTypeDescription']
    @phone = data['FacilityPhone']
    @map_url = data['FacilityMapURL']
    @reservation_url = data['FacilityReservationURL']
    @directions = data['FacilityDirections']
    @name = data['FacilityName']
    @keywords = data['Keywords']
    @fee = data['FacilityUseFeeDescription'] == '' ? 'None' : data['FacilityUseFeeDescription']
    @stay_limit = data['StayLimit']
    @last_updated_date = data['LastUpdatedDate']
    @is_accessible = data['FacilityAdaAccess'] ? true : false
    @id = data['FacilityID']
  end
end
