require 'spec_helper'

describe "/posts", :js => true do

	context "INDEX" do
		it 'links the individual blog posts page' do

			@post = Post.create(:title => "Hello World")
			visit '/'

			expect(page).to have_link("Hello World")
		end
	end

	context "SHOW" do
		it 'should have the content and title of a post' do

			@post = Post.create(:title => "Hello World", :content => "A Wonderful Day")
			visit "/posts/#{@post.id}"

			expect(page).to have_content(@post.title)
			expect(page).to have_content(@post.content)
		end
	end

	context "NEW" do
		it 'renders a form to create a new blog post' do
			visit '/posts/new'

			expect(page).to have_selector("form[action='/posts']")
			expect(page).to have_field("author_name")
		end
	end

	context "CREATE" do
		it 'submits the form to the DB after submission' do
			visit '/posts/new'
			fill_in 'post[title]', :with => "Hello World"
			click_button "submit"

			expect(Post.find_by(:title => "Hello World")).to_not be_nil
			expect(page).to have_content("Hello World")
		end
	end

end






