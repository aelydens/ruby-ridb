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
  #returns a collection of all USDA campsites
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
    # => "WestWorld is located in north Scottsdale at the base of the McDowell Mountains.  Surrounded by the Sonoran Desert with over 360 acres of pristine landscaping, the covered Equidome Arena, Brett's Barn, and state-of-the-art equine facilities provide a spectacular setting for a variety of venues..."

    p client.facilities.first.fee
    # => "None"
  ```

  #For searches:

  ```ruby
  #coming soon
  ```

  ## To Contribute
  - fork
  - clone
  - bundle
  - make awesome changes
  - run tests
  - PR

  PRs and suggestions happily accepted.
