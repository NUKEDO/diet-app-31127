class DietMethod < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :type_id
    validates :explanation
    validates :user
  end

end
