# frozen_string_literal: true

class Api::V1::Github::RepositoriesController < ApplicationController

  # GET /api/v1/github/repositories
  # GET /api/v1/github/repositories.json
  def index
    api_success('oi')
  end
end
