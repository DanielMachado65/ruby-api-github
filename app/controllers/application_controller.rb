class ApplicationController < ActionController::API
  # --------------------------- error
  def api_error(data={})
    @api_response = { data: data }
    render json: @api_response, status: :bad_request
  end

  def api_bad_request(data={})
    @api_response = { data: data }
    render json: @api_response, status: :not_acceptable
  end

  def api_not_found(data={})
    @api_response = { data: data }
    render json: @api_response, status: :not_found
  end

  def api_unauthorized(data={})
    @api_response = { data: data }
    render json: @api_response, status: :forbidden
  end

  def api_forbidden(data={})
    @api_response = { data: data }
    render json: @api_response, status: :unauthorized
  end

  # --------------------------- success
  def api_created(data={})
    @api_response = { data: data }
    render json: @api_response, status: :created
  end

  def api_success(data={})
    @api_response = { data: data }
    render json: @api_response, status: :ok
  end

  def api_no_content(data={})
    @api_response = { data: data }
    render json: @api_response, status: :no_content
  end
end
