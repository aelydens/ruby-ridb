class RecreationArea
  attr_reader :map_url, :last_updated_by, :reservation_url, :fee_description,
  :name, :description, :keywords, :email, :latitude, :stay_limit, :geojson, :last_updated_date,
  :id, :longitude, :directions, :phone, :org_id

  def initialize(data)
    @map_url = data["RecAreaMapURL"]
    @last_updated_by = data["LastUpdatedBy"]
    @reservation_url = data["RecAreaReservationURL"]
    @fee_description = data["RecAreaFeeDescription"]
    @name = data["RecAreaName"]
    @description = data["RecAreaDescription"]
    @keywords = data["Keywords"]
    @email = data["RecAreaEmail"]
    @latitude = data["RecAreaLatitude"]
    @stay_limit = data["StayLimit"]
    @geojson = data["GEOJSON"]
    @last_updated_date = data["LastUpdatedDate"]
    @id = data["RecAreaID"]
    @longitude = data["RecAreaLongitude"]
    @directions = data["RecAreaDirections"]
    @phone = data["RecAreaPhone"]
    @org_id = data["OrgRecAreaID"]
  end
end
