require 'rails_helper'
require 'pry'

RSpec.describe 'Repositories', type: :request do

  context 'GET /repositories' do
    describe 'index' do
      it 'find elements' do
        get api_v1_github_repositories_path
        expect(response).to have_http_status(200)
        expect(response).to match_response_schema('repositories/index')
      end
    end

    describe 'filter' do
      it 'language: python - find' do
        get api_v1_github_repositories_path, params: {language: 'python'}
        repositories = JSON.parse response.body

        expect(response).to have_http_status(200)
        expect(repositories[0]['language']).to match(/python/)
      end

      it 'language: ruby - not find' do
        get api_v1_github_repositories_path, params: {language: 'ruby'}

        expect(response).to have_http_status(404)
      end

      it 'order: more starts' do
        get api_v1_github_repositories_path, params: {order: 'desc'}
        repositories = JSON.parse response.body

        expect(response).to have_http_status(200)
        stars = Repository.order(stars_count: :desc).first.stars_count
        expect(repositories[0]['stars_count']).to eq stars
      end

      it 'order: less stars' do
        get api_v1_github_repositories_path, params: {order: 'asc'}
        repositories = JSON.parse response.body

        expect(response).to have_http_status(200)
        stars = Repository.order(stars_count: :asc).first.stars_count
        expect(repositories[0]['stars_count']).to eq stars
      end

      it 'limit: exactly 10' do
        get api_v1_github_repositories_path, params: {limit: 10}
        repositories = JSON.parse response.body

        expect(response).to have_http_status(200)
        expect(repositories.count).to eq 10
      end

      it 'order: more start & limit: 10' do
        get api_v1_github_repositories_path, params: {limit: 10, order: 'desc'}
        repositories = JSON.parse response.body

        expect(response).to have_http_status(200)
        stars = Repository.order(stars_count: :desc).first.stars_count
        expect(repositories.count).to eq 10
        expect(repositories[0]['stars_count']).to eq stars
      end
    end
  end

  context 'GET /repositories/1' do
    describe 'show' do
      it 'find one element' do
        get api_v1_github_repository_path(200)

        expect(response).to have_http_status(200)
        expect(response).to match_response_schema('repository')
      end

      it 'dont find element' do
        get api_v1_github_repository_path(1)

        expect(response).to have_http_status(404)
      end
    end
  end

  context 'GET /refresh' do
    it 'refresh page application' do
      get api_v1_github_refresh_path

      info = JSON.parse response.body
      expect(response).to have_http_status(200)
      expect(info['data']).to eq 'atualizado com sucesso'
    end
  end
end
