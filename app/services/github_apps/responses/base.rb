require 'net/http'

module GithubApps
  module Responses
    class Base
      def initialize
        fail NoMethodError
      end

      def response
        http.request(request)
      end

      private

      def request
        fail NoMethodError
      end

      def http
        Net::HTTP.new(@uri.host, @uri.port).tap do |http|
          http.use_ssl = true
        end
      end

      def http_post
        Net::HTTP::Post.new(@uri)
      end

      def http_get
        Net::HTTP::Get.new(@uri)
      end
    end # class Base
  end # module Responses
end # module GithubApps
