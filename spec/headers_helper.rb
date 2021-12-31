require 'devise/jwt/test_helpers'

def authenticated_header(user)
  Devise::JWT::TestHelpers.auth_headers({}, user)
end