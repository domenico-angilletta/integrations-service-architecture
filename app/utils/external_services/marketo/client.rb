module ExternalServices
  module Marketo
    class Client
      def initialize(credentials)
      end

      def upsert_lead(firstname, lastname, ...)
        catch_errors do
          # USE EXTERNAL GEM TO INTERACT WITH MARKETO
        end
      end

      def list_programs
        catch_errors do
          # USE EXTERNAL GEM TO INTERACT WITH MARKETO
        end
      end
    end

    private

    def catch_errors(&block)
      yield
    rescue Mrkt::Errors::Error => e
      raise PermanentError.new(e)
    rescue Faraday::ConnectionFailed => e
      raise TemporaryError.new(e) 
    end
  end
end
