# frozen_string_literal: true
module DecidimHospitalet
  module Surveys
    module Admin
      # A command with all the business logic when a user updates a survey.
      class UpdateSurveyResult < Rectify::Command
        # Public: Initializes the command.
        #
        # form - A form object with the params.
        def initialize(form, survey_result)
          @form = form
          @survey_result = survey_result
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid, together with the proposal.
        # - :invalid if the form wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if form.invalid?

          update_survey_result
          broadcast(:ok, survey_result)
        end

        private

        attr_reader :form, :survey_result

        def update_survey_result
          @survey_result.update_attributes!(attributes)
        end

        def attributes
          {
            other_priorities: form.other_priorities,
            future_ideas: form.future_ideas,
            gender: form.gender,
            age_group: form.age_group,
            zip_code: form.zip_code,
            living_at_scope: form.living_at_scope,
            working_at_scope: form.working_at_scope,
            city: form.city,
            name: form.name,
            phone: form.phone,
            selected_categories: form.categories.map(&:id),
            scope: form.scope
          }
        end
      end
    end
  end
end