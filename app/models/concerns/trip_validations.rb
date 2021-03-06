module TripValidations
  extend ActiveSupport::Concern
  included do
    validates :distance, numericality: true, allow_nil: true
    validates :price, numericality: true
    validates :date, date: true
    validate :addresses_format

    ADDRESS_FIELDS = %w(start_address destination_address).freeze

    private

    def addresses_format
      ADDRESS_FIELDS.each { |address| validate_address(address) }
    end

    def validate_address(address)
      unless send(address)
        errors.add(address, I18n.t('errors.validations.address_blank'))
        return
      end

      unless send(address).split(',').size == 3
        errors.add(address, I18n.t('errors.validations.address_invalid', field: send(address)))
      end
    end
  end
end
