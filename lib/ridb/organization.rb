class Organization
  attr_reader :org_abbrev_name, :id, :org_type, :last_updated_date, :url_text,
  :url, :image_url, :parent_id, :name

  def initialize(data)
    @abbrev_name = data['OrgAbbrevName']
    @id = data['OrgId']
    @jurisdiction_type = data['OrgJurisdictionType']
    @type = data['OrgType']
    @last_updated_date = data['lastUpdatedDate']
    @url_text = data['OrgUrlText']
    @url = data['OrgUrlAddress']
    @image_url = data['OrgImageUrl']
    @parent_id = data['OrgParentID']
    @name = data['OrgName']
  end
end
