class Admin::ApplicationController < ApplicationController
  private

  def access_control
    Rails.logger.info('----ACCESS----')
  end
end
