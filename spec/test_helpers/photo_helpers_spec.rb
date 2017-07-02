def most_recent_photo
    Photo.order("created_at").last
end