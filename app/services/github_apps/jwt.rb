require 'openssl'
require 'jwt'

module GithubApps
  class Jwt
    ALGORITHM = 'RS256'

    def self.jwt
      new.jwt
    end

    def jwt
      JWT.encode(payload, @private_key, ALGORITHM)
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
  end # class Jwt
end # module GithubApps
