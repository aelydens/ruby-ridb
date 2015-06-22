# USDA RIDB API Ruby Gem

This is a Ruby wrapper for the USDA's RIDB API.
Documentation for the API can be found [here.](http://usda.github.io/RIDB/)
Register for an API key [here.](https://ridb.recreation.gov/?action=register)

## Installation
    gem install ruby-ridb

## Basic Setup and Use
  Initialize the RIDB::Client module with your api key.

  Information will be returned in a JSON payload. Attributes can be called by snake_case methods. Examples below:

  To get a collection of all organizations, facilities, campsites, or rec areas, simply call your desired entity as a method on an instance of the module.

  ```ruby
  client = RIDB::Client.new(API_KEY)
  #get a collection of all USDA campsites
  client.campsites

  #get names of all USDA recreation areas
  client.recreation_areas.map(&:name)
  ```

  To get specific attributes:

  ```ruby
    client = RIDB::Client.new(API_KEY)

    p client.organizations.first.name
    # => "American Battle Monuments Commission"

    p client.recreation_areas.first.description
    # => "WestWorld is located in north Scottsdale at the base of the McDowell Mountains..."

    p client.facilities.first.fee
    # => "None"
  ```

#For searches:

  Searches return JSON objects.

  ```ruby
  #search orgs, campsites, facilities, and rec areas by id
  client.find_campsite_by_id(4)
  client.find_facility_by_id(12)
  client.find_recreation_area_by_id(51)
  client.find_organization_by_id(23)

  #v1 search supports simple query strings. See docs for limitations.
  client.search_campsites("Overnight")
  client.search_facilities("Bush library")
  client.search_recreation_areas("Upper colorado river")
  client.search_recreation_areas("white river national forest")

  #more complex query strings can be used with search methods:
  client.search_facilities("lake&limit=10&state=CO")
  # => will return up to 10 results that match the query 'lake' in CO.

  ```
  Future iterations of the gem will support searches by state & more complex queries.

## To Contribute
  - Fork
  - Bundle
  - Create a feature branch
  - Commit your changes
  - Push to your feature branch
  - PR

PRs and suggestions happily accepted.
