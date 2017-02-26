class LikeValidator < ActiveModel::Validator
  def validate(record)
    if record.post.user_id == record.user_id
      record.errors[:user_id] << 'You cannot like your own post'
    end
  end
end
