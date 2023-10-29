json.extract! article, :id, :title, :lead, :thumbnail, :text_content, :media, :mood_value, :keywords, :is_longformat, :is_draft, :created_at, :updated_at
json.url article_url(article, format: :json)
