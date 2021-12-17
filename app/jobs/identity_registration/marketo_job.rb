module IdentityRegistration
  class MarketoJob < BaseJob
    def execute_job
      return unless enabled_rule_for?(:identity_registration)

      client.create_lead(payload[:email], ...)
    end

    private

    def enabled_rule_for?(event)
      # logic to check if on this integration the specific rule is enabled
    end
  end
end
