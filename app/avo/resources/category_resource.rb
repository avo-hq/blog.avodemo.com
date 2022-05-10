class CategoryResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(id_eq: params[:q], title_cont: params[:q], description_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  field :title, as: :text
  field :description, as: :textarea
  field :posts_count, as: :text do |model|
    model.posts.count
  end

  field :posts, as: :has_many, attach_scope: -> { query.where.not(category_id: parent.id).or(query.where(category_id: nil)) }
  # add fields here
end
