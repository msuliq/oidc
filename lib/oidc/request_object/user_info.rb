module Oidc
  class RequestObject
    class UserInfo < ConnectObject
      include Claimable
    end
  end
end