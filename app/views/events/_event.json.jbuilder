date_format = "%Y-%m-%d %H:%M%z"
json.extract! event, :id, :title
json.url event_url(event, format: :json)
json.show_url event_url(event, format: :html)
json.start event.start_time.strftime(date_format)
json.end event.end_time.strftime(date_format)
json.allDay event.all_day
