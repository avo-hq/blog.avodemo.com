class UserResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  field :email, as: :gravatar, link_to_resource: true, as_avatar: true
  field :name, as: :text
  field :email, as: :text, as_description: false
  field :something, as: :text, as_description: true do |model|
    "Something about this record with id of #{model.id}."
  end

  field :posts, as: :has_many
  field :comments, as: :has_many
  # add fields here
end
