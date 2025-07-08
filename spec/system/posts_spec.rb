require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'creates a new post' do
    visit posts_path
    click_link 'New post'

    fill_in 'Title', with: 'Test Post'
    fill_in 'Body', with: 'Test Content'
    click_button 'Create Post'

    expect(page).to have_content('Post was successfully created')
    expect(page).to have_content('Test Post')
  end

  it 'updates an existing post' do
    post = Post.create!(title: 'Test Post', body: 'Test Content')
    visit post_path(post)

    click_link 'Edit this post', match: :first
    fill_in 'Title', with: 'Updated Title'
    click_button 'Update Post'

    expect(page).to have_content('Post was successfully updated')
    expect(page).to have_content('Updated Title')
  end

  it 'shows a list of posts' do
    posts = create_list(:post, 3)
    visit posts_path

    posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'deletes a post', js: true do
    post = create(:post)
    visit posts_path

    accept_confirm do
      click_link 'Destroy', match: :first
    end

    expect(page).to have_content('Post was successfully destroyed')
    expect(page).not_to have_content(post.title)
  end
end