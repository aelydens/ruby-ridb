class Campsite
  attr_reader :last_updated_by, :last_updated_date, :type_of_use, :is_overnight,
  :is_accessible, :type, :id, :loop, :facility_id

  def initialize(data)
    @last_updated_by = data['LastUpdatedBy']
    @last_updated_date = data['LastUpdatedDate']
    @type_of_use = data['TypeOfUse']
    @created_date = data['CreatedDate']
    @is_overnight = data['TypeOfUse'] == 'Overnight' ? true : false
    @type = data['type']
    @id = data['CampsiteID']
    @loop = data['Loop']
    @is_accessible = data['CampsiteAccessible'] ? true : false
    @facility_id = data['FacilityID']
  end
end
