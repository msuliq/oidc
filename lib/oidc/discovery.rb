module Oidc
  module Discovery
    class InvalidIdentifier < Exception; end
    class DiscoveryFailed < Exception; end
  end
end

require 'oidc/discovery/provider'