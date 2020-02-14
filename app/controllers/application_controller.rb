class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search, if: :devise_controller?

  def set_search
    @q = Radio.ransack(params[:q])
    @radios = @q.result(distinct: true)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :image_cache, :gender, :age])
  end
end
