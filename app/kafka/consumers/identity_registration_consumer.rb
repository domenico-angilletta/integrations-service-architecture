module Kafka
  module Consumers
    class IdentityRegistrationConsumer
      def perform
        organization_id = payload[:organization_id]

        Integration.enabled.where(organization_id: organization_id).each do |integration|
          trigger_integration(integration)
        end
      end

      private

      def trigger_integration(integration)
        # NOT THE MOST ELEGANT SOLUTION, MAYBE WE CAN FIND SOMETHING BETTER
        case integration.slug
        when "marketo"
          IdentityRegistration::MarketoJob.perform(payload, integration)
        when "hubspot"
          IdentityRegistration::HubspotJob.perform(payload, integration)
        when "salesforce"
          IdentityRegistration::SalesforceJob.perform(payload, integration)
        else
          raise ...
        end
      end
    end
  end
end
