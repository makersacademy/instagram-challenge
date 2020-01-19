RSpec.describe 'liking a post', type: :feature do
  before do
    sign_up_sam
    post_picture_of_breakfast
    click_on 'Log out'

    sign_up_elodie
    click_on 'Home'
    click_on 'Like'
  end

  scenario 'a user likes a post' do
    click_on 'Log out'

    log_in_sam
    click_on 'Home'

    expect(page).to have_content 'Elodie liked this post'
  end

  scenario 'a user unlikes a post' do
    click_on 'Unlike'

    expect(page).to have_content 'Like'
    expect(page).not_to have_content 'Elodie liked this post'
  end
  
  describe 'edge cases' do
    before do
      click_on 'Log out'

      sign_up_leina
      click_on 'Home'
      click_on 'Like'
    end

    context 'multiple likes' do
      scenario 'two users like a post' do
        click_on 'Log out'

        log_in_sam
        click_on 'Home'

        expect(page).to have_content 'Elodie and Leina liked this post'
      end

      scenario 'more than two users like a post' do
        click_on 'Log out'

        sign_up_emmanuel
        click_on 'Home'
        click_on 'Like'
        click_on 'Log out'

        log_in_sam
        click_on 'Home'

        expect(page).to have_content 'Elodie and 2 others liked this post'
      end
    end

    context 'liking your own post' do
      it 'should prioritise the signed-in user in the like description' do
        click_on 'Log out'

        sign_up_emmanuel
        click_on 'Home'
        click_on 'Like'
        click_on 'Log out'

        log_in_sam
        click_on 'Home'
        click_on 'Like'

        expect(page).to have_content 'You and 3 others liked this post'

        click_on 'Profile'
        post_picture_of_dog
        click_on 'Like'

        expect(page).to have_content 'You liked this post'
      end
    end
  end
end
