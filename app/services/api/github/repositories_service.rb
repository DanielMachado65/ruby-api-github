# frozen_string_literal: true

module Api
  module Github
    # service for repository
    class RepositoriesService

      # @param [Object] params
      # essa foi a única parte que não ficou claro, se era para separar as querys
      def self.execute(params)
        return Repository.order(stars_count: :desc).limit(5) if query_supported(params)

        @repo = Repository.where(nil) # creates an anonymous scope
        @repo = @repo.language(params['language']) if params['language'].present?
        @repo = @repo.limit(params[:limit]) if params[:limit].present?

        @repo = @repo.order(stars_count: params[:order]) if params[:order].present?
      rescue ArgumentError
        @repo = []
      end

      # @param [Object] params
      def self.create_owner(params)
        owner = Owner.find_or_create_by(params.as_json(only: %w[login url html_url
                                                             site_admin
                                                             avatar_url]))
        owner.type_of_user = params['type'].downcase
        owner.github_id = params['id']
        owner.save && owner
      end

      # @param [Object] params
      def self.create_repository_reference(params, owner)
        attributes = params.as_json(only: %w[full_name url default_branch
                                         git_url ssh_url clone_url svn_url home
                                         size watchers_count forks_count
                                         open_issues_count score has_issues has_projects
                                         has_downloads has_wiki has_pages archived disabled license private description])
        repo = Repository.find_or_create_by(attributes)
        repo.stars_count = params['stargazers_count']
        repo.language = params['language'].present? && params['language'].downcase
        repo.github_id = params['id']
        repo.repository_date_create = params['created_at']
        repo.repository_date_update = params['updated_at']
        repo.owner = owner
        repo.save && repo
      end

      class << self
        def query_supported(params)
          params.permit(:language, :sort, :limit)
        end
      end
    end
  end
end