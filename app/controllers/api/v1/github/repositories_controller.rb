# frozen_string_literal: true

# controller
class Api::V1::Github::RepositoriesController < ApplicationController

  # GET /api/v1/github/repositories
  # GET /api/v1/github/repositories?language=Ruby
  def index
    @repositories = Api::Github::RepositoriesService.execute(params)
    return api_error('dado não encontrado, por favor atualize.') if @repositories.blank?

    render json: @repositories, status: 200
  end

  # GET /api/v1/github/repositories/1
  def show
    @repository = Repository.find_by(id: params[:id])
    return api_error('não foi encontrado') if @repository.blank?

    render json: @repository, status: 200
  end

  # GET /api/v1/github/refresh
  def refresh_page
    refresh
    return api_success('atualizado com sucesso') if Repository.count.positive?

    api_error('ocorreu algum erro')
  end

  private

  def need_refresh
    refresh if Repository.count.zero?
  end

  def refresh
    @response = request_search_repositories(sort: 'stars', order: 'desc')
    @response['items'].map do |repository|
      owner = create_owner(repository['owner'])
      create_repository(repository, owner).present?
    end
  end

  def create_repository(repository, owner)
    Api::Github::RepositoriesService.create_repository_reference(repository,
                                                                 owner)
  end

  def create_owner(owner)
    Api::Github::RepositoriesService.create_owner(owner)
  end

  def request_search_repositories(params = {})
    url = "#{ENV['GITHUB_MAIN_URL']}"\
                  '/search/repositories'\
                  "#{params.blank? ? '' : format_params('?q=', params)}"
    HTTParty.get(url)
  end

  def format_params(string, params)
    params.map {|p| string += "#{p[0]}=#{p[1]}&"} && (string[-1] = '') && string
  end
end
