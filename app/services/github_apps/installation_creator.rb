require 'openssl'
require 'jwt'

module GithubApps
  class InstallationCreator
    def self.create(user, installation_uuid)
      new(user, installation_uuid).create
    end

    def create
      @user.installations.create(uuid: @installation_uuid)
    end

    private

    def initialize(user, installation_uuid)
      @user = user
      @installation_uuid = installation_uuid
    end
  end # class InstallationCreator
end # module GithubApps
