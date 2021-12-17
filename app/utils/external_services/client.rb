module ExternalServices
  class Client
    class Error < StandardError; end
    class PermanentError < Error; end
    class TemporaryError < Error; end
  end
end
