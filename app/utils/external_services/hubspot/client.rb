module ExternalServices
  module Hubspot
    class Client
      def initialize(credentials)
      end

      def upsert_lead(firstname, lastname, ...)
        catch_errors do
          # USE EXTERNAL GEM TO INTERACT WITH HUBSPOT
        end
      end

      def list_campaigns
        catch_errors do
          # USE EXTERNAL GEM TO INTERACT WITH HUBSPOT
        end
      end
    end

    private

    def catch_errors(&block)
      yield
    rescue Hubspot::Errors::Error => e
      raise PermanentError.new(e)
    rescue Faraday::ConnectionFailed => e
      raise TemporaryError.new(e) 
    end
  end
end
