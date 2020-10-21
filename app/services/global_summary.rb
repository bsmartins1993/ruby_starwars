class GlobalSummary
include HTTParty
require 'net/http'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
base_uri 'https://swapi.dev/api'

def initialize
@options = {}
end

def general
    self.class.get('/films/?format=json', @options)
end

end