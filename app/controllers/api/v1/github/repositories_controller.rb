# frozen_string_literal: true

class Api::V1::Github::RepositoriesController < ApplicationController
  before_action :refresh, only: :index
  # GET /api/v1/github/repositories
  # GET /api/v1/github/repositories.json
  def index
    api_success('oi')
  end
  
  def refresh
    @response =
  end
end
