class ConversionsController < ApplicationController
    def new
        @currency_codes = Conversion.currency_codes
        @conversion = Conversion.new
    end

    def create
        @conversion = Conversion.new
        @conversion.assign_attributes(conversion_params)
        if @conversion.save
            redirect_to conversion_url(@conversion)
        else
            flash[:notice] = "Error: could not convert, please try again"
            redirect_to root_path
        end
    end

    def show
        @conversion = Conversion.find(params[:id])
    end

    private

    def conversion_params
        params.require(:conversion).permit(:starting_currency, :amount, :final_currency)
    end
end
