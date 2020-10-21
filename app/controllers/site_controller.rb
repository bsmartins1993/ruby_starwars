class SiteController < ApplicationController
    layout 'site'

    before_action :set_global_summary_service

    def index
        @summary = @summary_service.general
    end

    def set_global_summary_service
        @summary_service = GlobalSummary.new
    end
end


