module EventEnded
  class HubspotJob < BaseJob
    def execute_job
      return unless enabled_rule_for?(:event_ended)

      # process payload
    end

    private

    def enabled_rule_for?(event)
      # logic to check if on this integration the specific rule is enabled
    end
  end
end
