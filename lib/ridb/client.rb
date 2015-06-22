require 'httparty'
require_relative 'search'

module RIDB
  class Client
    include RIDB::Search

    include HTTParty
    base_uri 'https://ridb.recreation.gov/'

    def initialize(key)
      @options = { headers: {'apikey' => key} }
    end

    def organizations
      response = self.class.get("/api/v1/organizations", @options)
      response = JSON.parse(response.body)
      parse_organizations(response["RECDATA"])
    end

    def campsites
      response = self.class.get("/api/v1/campsites", @options)
      response = JSON.parse(response.body)
      parse_campsites(response["RECDATA"])
    end

    def recreation_areas
      response = self.class.get("/api/v1/recareas", @options)
      response = JSON.parse(response.body)
      parse_recreation_areas(response["RECDATA"])
    end

    def facilities
      response = self.class.get("/api/v1/facilities", @options)
      response = JSON.parse(response.body)
      parse_facilities(response["RECDATA"])
    end

    def parse_organizations(organizations)
      organizations.map{|org| Organization.new(org) }
    end

    def parse_campsites(campsites)
      campsites.map{|camp| Campsite.new(camp) }
    end

    def parse_recreation_areas(rec_areas)
      rec_areas.map{|rec| RecreationArea.new(rec) }
    end

    def parse_facilities(facilities)
      facilities.map{|fac| Facility.new(fac) }
    end
  end

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
end
