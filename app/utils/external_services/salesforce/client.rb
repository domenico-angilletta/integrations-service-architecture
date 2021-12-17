module ExternalServices
  module Salesforce
    class Client
      def initialize(credentials)
      end

      def upsert_lead(firstname, lastname, ...)
        catch_errors do
          # USE EXTERNAL GEM TO INTERACT WITH SALESFORCE
        end
      end

      def list_campaigns
        catch_errors do
          # USE EXTERNAL GEM TO INTERACT WITH SALESFORCE
        end
      end
    end

    private

    def catch_errors(&block)
      yield
    rescue Salesforce::Errors::Error => e
      raise PermanentError.new(e)
    rescue Faraday::ConnectionFailed => e
      raise TemporaryError.new(e) 
    end
  end
end
