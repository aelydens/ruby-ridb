module RIDB
  module Search

    def find_campsite_by_id(id)
      response = self.class.get("https://ridb.recreation.gov/api/v1/campsites/#{id}", @options)
      response = JSON.parse(response.body)
    end

    def find_facility_by_id(id)
      response = self.class.get("https://ridb.recreation.gov/api/v1/facilities/#{id}", @options)
      response = JSON.parse(response.body)
    end

    def find_recreation_area_by_id(id)
      response = self.class.get("https://ridb.recreation.gov/api/v1/recareas/#{id}", @options)
      response = JSON.parse(response.body)
    end

    def find_organization_by_id(id)
      response = self.class.get("https://ridb.recreation.gov/api/v1/organizations/#{id}", @options)
      response = JSON.parse(response.body)
    end

    def search_campsites(query_string)
      response = self.class.get("https://ridb.recreation.gov/api/v1/campsites/?query=#{query_string}", @options)
      response = JSON.parse(response.body)
    end

    def search_facilities(query_string)
      response = self.class.get("https://ridb.recreation.gov/api/v1/facilities?query=#{query_string}", @options)
      response = JSON.parse(response.body)
    end

    def search_organizations(query_string)
      response = self.class.get("https://ridb.recreation.gov/api/v1/organizations?query=#{query_string}", @options)
      response = JSON.parse(response.body)
    end

    def search_recreation_areas(query_string)
      response = self.class.get("https://ridb.recreation.gov/api/v1/recareas?query=#{query_string}", @options)
      response = JSON.parse(response.body)
    end

  end
end
