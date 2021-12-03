json.extract! lesson, :id, :coach_id, :player_id, :date, :time, :court_id,
              :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
