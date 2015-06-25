require 'httparty'
require_relative 'search'
require_relative 'organization'
require_relative 'campsite'
require_relative 'facility'
require_relative 'recarea'

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
end
