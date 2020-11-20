class DietMethod < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :type_id, numericality: { other_than: 1 }
    validates :explanation
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
end