class Api::V1::VesselsController < ApplicationController
  before_action :set_vessel, only: %i[update show destroy]
  before_action :set_page, only: [:index]
  include Response
  include Pagination
  DEFAULT_PAGE = 1
  DEFAULT_PAGE_SIZE = 3

  def index
    vessel = Vessel.page(@page).per(@size)
    pages  = pagination(vessel)
    json_response({message: I18n.t('vessel.list'), data: vessel.as_json, pagination: pages}, 200)
  end

  def show
    if @vessel
      json_response({message: I18n.t('vessel.show'), data: @vessel.as_json}, 200)
    else
      json_response({message: I18n.t('not_found')}, 404)
    end
  end

  def create
    if params[:vessel].present?
      vessel = Vessel.new(vessels_params)
      begin
        if vessel.save
          json_response({data: vessel.as_json, message: I18n.t('vessel.create')}, 200)
        else
          json_response({message: vessel.errors.full_messages.to_sentence}, 400)
        end
      rescue => e
        json_response({message: I18n.t('server_error')}, 500)
      end
    else
      json_response({message: I18n.t('bad_request')}, 400)
    end
  end

  def update
    if @vessel.update(vessels_params)
      json_response({message: I18n.t('vessel.update'), data: @vessel.as_json}, 200)
    else
      json_response({message: @vessel.errors.full_messages.to_sentence, data: @vessel.as_json}, 400)
    end
  end

  def destroy
    if @vessel.destroy
      json_response({message: I18n.t('vessel.delete')}, 200)
    else
      json_response({message: @vessel.errors.full_messages.to_sentence}, 400)
    end
  end

  private
  def set_page
    @page = params[:page].present? ? params[:page].to_i : DEFAULT_PAGE
    @size = params[:size].present? ? params[:size].to_i : DEFAULT_PAGE_SIZE
  end

  def set_vessel
    @vessel = Vessel.find_by(id: params[:id])
  end

  def vessels_params
    params[:vessel].permit(:name, :company_id, :naccs_code)
  end
end
