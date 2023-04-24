# frozen_string_literal: true

class QuestionnaireLabelingFormComponent < ViewComponent::Base
  def initialize(cf:)
    @cf = cf
    @label_id_options = Label.order(:created_at).pluck(:name, :id)
    @color_options =
      Labeling.colors.keys.map do |key|
        [Labeling.human_attribute_name("colors.#{key}"), key]
      end
  end
end
