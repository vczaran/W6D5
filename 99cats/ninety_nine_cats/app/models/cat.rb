class Cat < ApplicationRecord
    CAT_COLORS = %w(brown tabby black white gray ginger calico tortoiseshell)
    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: { in: %w(m f),
    message: "%{value} is not a valid sex" }
    validates :color, inclusion: { in: CAT_COLORS,
    message: "%{value} is not a valid color" }
    validate :birth_date_cannot_be_in_future

    def birth_date_cannot_be_in_future
        if !birth_date.blank? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end
end
