require 'fog/core'
require 'fog/json'
require 'fog/sakuracloud/compute'
require 'fog/sakuracloud/volume'
require 'fog/sakuracloud/network'

module Fog
  module SakuraCloud
    extend Fog::Provider

    SAKURACLOUD_API_VERSION = '1.1' unless defined? SAKURACLOUD_API_VERSION
    SAKURACLOUD_API_ZONE = "is1b" unless defined? SAKURACLOUD_API_ZONE
    SAKURACLOUD_API_ENDPOINT = "/cloud/zone/#{SAKURACLOUD_API_ZONE}/api/cloud/#{SAKURACLOUD_API_VERSION}/"

    service(:compute, 'Compute')
    service(:volume, 'Volume')
    service(:network, 'Network')
  end
end
