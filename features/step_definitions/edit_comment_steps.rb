Given(/^a comment has been made$/) do
  @otherComment = FactoryGirl.create(:comment,
                                     body: 'great',
                                     user_id: @otherUser.id,
                                     post_id: @post.id)
end

Given(/^a comment has been made by me$/) do
  @comment = FactoryGirl.create(:comment,
                                body: 'great',
                                user_id: @me.id,
                                post_id: @post.id)
end
