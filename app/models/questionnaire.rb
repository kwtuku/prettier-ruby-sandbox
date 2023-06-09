# == Schema Information
#
# Table name: questionnaires
#
#  id          :uuid             not null, primary key
#  agreed      :boolean          default(FALSE), not null
#  comfortable :boolean          default(TRUE), not null
#  description :text             default(""), not null
#  end_at      :datetime
#  expire_on   :date
#  level       :string           not null
#  start_at    :datetime
#  title       :string           not null
#  visibility  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_questionnaires_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Questionnaire < ApplicationRecord
  enum :level,
       poor: "poor",
       fair: "fair",
       satisfactory: "satisfactory",
       very_good: "very_good",
       excellent: "excellent"
  enum :visibility, draft: 0, restricted: 1, published: 2

  belongs_to :user

  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  accepts_nested_attributes_for :labelings,
                                allow_destroy: true,
                                reject_if: :label_id_blank

  validates :title, length: { in: 1..50 }
  validates :description, length: { in: 0..500 }
  validates :level, inclusion: Questionnaire.levels.keys
  validates :visibility, inclusion: Questionnaire.visibilities.keys
  validates :start_at,
            comparison: {
              less_than_or_equal_to: :end_at,
            },
            allow_nil: true,
            if: :end_at

  def label_id_blank(labeling_attributes)
    labeling_attributes["label_id"].blank?
  end
end
