class Integration
  belongs_to :external_service

  def client
    case external_service.slug
    when "marketo"
      ExternalServices::Marketo::Client.new(credentials)
    when 
      ExternalServices::Hubspot::Client.new(credentials) 
    when 
      ExternalServices::Salesforce::Client.new(credentials) 
    else
      raise
    end
  end

  private

  def credentials
    # based on the integration type we need different types of credentials
  end
end
