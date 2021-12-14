class ConversionsController < ApplicationController
    def index
        conversion_service = ConversionService.new
        @currency_codes = conversion_service.currency_codes
    end
end
