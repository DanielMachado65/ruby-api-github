class RepositorySerializer < ActiveModel::Serializer
  attributes :id, :full_name, :url, :language, :git_url,
             :repository_date_create, :repository_date_update,
             :stars_count, :forks_count, :score, :github_id,
             :description
  attribute :owner

  def owner
    object.owner
  end
end