# == Schema Information
#
# Table name: labelings
#
#  id               :uuid             not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :uuid             not null
#  questionnaire_id :uuid             not null
#
# Indexes
#
#  index_labelings_on_label_id                       (label_id)
#  index_labelings_on_questionnaire_id_and_label_id  (questionnaire_id,label_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (label_id => labels.id)
#  fk_rails_...  (questionnaire_id => questionnaires.id)
#
class Labeling < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :label

  validates :questionnaire_id, uniqueness: { scope: :label_id }
end
