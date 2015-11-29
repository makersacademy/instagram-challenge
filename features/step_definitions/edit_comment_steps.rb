Given(/^a comment has been made$/) do
  @otherComment = FactoryGirl.create(:comment,
                                     body: 'great',
                                     user_id: @otherUser.id,
                                     post_id: @post.id)
end
