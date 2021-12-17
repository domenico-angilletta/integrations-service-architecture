class BaseJob
  def initialize(paylod, integration)
    @payload = payload
    @integration = integration
  end

  def perform
    log_start
    execute_job
    log_result
  rescue PermanentError
    disconnect_integration
    logger.error(...)
  rescue TemporaryError
    logger.warn(...)
    raise # for retry
  end

  private

  def client
    @client ||= integration.client
  end

  def execute_job
    raise "not implemented"
  end

  def log_start
    logger.info(...)
  end

  def log_result
    logger.info(...)
  end

  def disconnect_integration
    # common logic to disconnect an integration because of permanent error
  end
end
