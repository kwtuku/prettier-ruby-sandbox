# == Schema Information
#
# Table name: labels
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_labels_on_name  (name) UNIQUE
#
class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :questionnaires, through: :labelings

  validates :name, length: { in: 1..50 }, uniqueness: true
end
