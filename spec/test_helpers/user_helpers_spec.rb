def most_recent_user
    User.order("created_at").last
end