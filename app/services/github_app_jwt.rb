require 'openssl'
require 'jwt'

class GithubAppJwt
  def self.jwt
    new.jwt
  end

  def jwt
    JWT.encode(payload, private_key, "RS256")
  end

  private

  def initialize
    @private_key = OpenSSL::PKey::RSA.new(ENV['PRIVATE_KEY_PEM'])
  end

  def payload
    {
      # issued at time
      iat: Time.now.to_i,
      # JWT expiration time (10 minute maximum)
      exp: Time.now.to_i + (10 * 60),
      # GitHub App's identifier
      iss: ENV['GITHUB_APPS_ISS']
    }
  end
end
