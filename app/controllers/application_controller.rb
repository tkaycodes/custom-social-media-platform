class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :remove_header, if: :devise_controller?
  before_filter :assign_tag_trends



  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :profile_picture
  end

  def remove_header
    @remove_header = true;
  end

  def assign_tag_trends
    @posttagz=Posttag.all
    @hashz=@posttagz.group(:tag_id).count;
    logger.warn "here is the main hash: #{@hashz}"
    @sorted=@hashz.sort_by{|k,v| v}.reverse
    logger.warn "here is the sorted hash: #{@sorted}"
    @finalarray=@sorted.take(5)
    logger.warn "here is the final array: #{@finalarray}"
  end


end


