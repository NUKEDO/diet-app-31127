class DietMethod < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :type_id
    validates :explanation
    validates :genre_id,    numerically: { other_than: 1 }
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
end