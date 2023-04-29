# frozen_string_literal: true

class QuestionnaireFormComponent < ViewComponent::Base
  def initialize(questionnaire:)
    @questionnaire = questionnaire
    @level_options =
      Questionnaire.levels.keys.map do |key|
        [Questionnaire.human_attribute_name("levels.#{key}"), key]
      end
    @visibility_options =
      Questionnaire.visibilities.keys.map do |key|
        [Questionnaire.human_attribute_name("visibilities.#{key}"), key]
      end
    @questionnaire.labelings.new
  end
end
