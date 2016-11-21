feature 'likes' do
  context 'when signed in' do
    before do
      sign_up
      create_post
      create_comment
    end

    context 'posts' do

      scenario "displays the amount of likes" do
        expect(page).to have_content "likes: 0"
        within 'span.post_like' do
          expect{click_link "like"}.to change(Like, :count).by 1
        end
        within 'span.post_like' do
          expect(page).to have_content "likes: 1"
        end
      end

      scenario "user can like a post only once" do
        within 'span.post_like' do
          click_link "like"
          expect{click_link "like"}.not_to change(Like, :count)
        end
        within 'span.post_like' do
          expect(page).to have_content "likes: 1"
        end
      end
    end

    context "comments" do
      scenario "displays the amount of likes" do
        expect(page).to have_content "likes: 0"
        within 'ul.comments' do
          expect{click_link "like"}.to change(Like, :count).by 1
        end
        within 'ul.comments' do
          expect(page).to have_content "likes: 1"
        end
      end

      scenario "user can like a comment only once" do
        within 'ul.comments' do
          click_link "like"
          expect{click_link "like"}.not_to change(Like, :count)
        end
        within 'ul.comments' do
          expect(page).to have_content "likes: 1"
        end
      end
    end
  end

  context "not signed in" do
    before do
      sign_up
      create_post
      create_comment
      click_link "Sign out"
    end

    scenario 'asked to sign in before you can like something' do
      within 'span.post_like' do
        expect{click_link "like"}.not_to change(Like, :count)
      end
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
    end

  end
end
