json.array!(@comments) do |comment|
  json.extract! comment, :id, :article_id, :name_user, :email_user, :message, :report, :status
  json.url comment_url(comment, format: :json)
end
