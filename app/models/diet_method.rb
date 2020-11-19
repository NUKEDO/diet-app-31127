class DietMethod < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :type_id
    validates :explanation
  end

  belongs_to :user
end
