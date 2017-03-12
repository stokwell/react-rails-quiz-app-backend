require 'rails_helper' 

RSpec.describe "PostsController", :type => :request  do 

  describe 'GET #index' do 
    it 'sends a list of posts' do 
      FactoryGirl.create_list(:post, 10)
      get '/api/posts'
      json = JSON.parse(response.body)
      expect(response).to be_success
    end
  end
  
  describe 'GET #show' do   
    it 'sends a specific post' do
      post = FactoryGirl.create(:post)    
      get "/api/posts/#{post.id}"
      json = JSON.parse(response.body)
      expect(response).to be_success
    end
  end  


  describe 'POST #create' do
    let(:post_params) { FactoryGirl.attributes_for :post }

    context 'when post params are invalid' do
      before(:each) { post '/api/posts', { post: {nothing: :here} }, headers }

      it 'responds with errors' do
        json = JSON.parse(response.body)
        expect(json).to be_truthy
      end
      it { expect(response).to have_http_status(422) }
    end

    context 'when comment params are valid' do
      before(:each) do 
        @post_attributes = FactoryGirl.attributes_for :post
        post '/api/posts', { post: @post_attributes }, headers
      end

      it 'creates post and responds with it' do
        post_response = JSON.parse(response.body, symbolize_names: true)
        expect(post_response[:body]).to eql @post_attributes[:body]
      end

      it { expect(response).to have_http_status(201) }
    end
  end


  describe 'DELETE #desroy' do 
    it 'deletes a specific post' do
      post = FactoryGirl.create(:post)  
      delete "/api/posts/#{post.id}"
      expect(response).to be_success
    end
  end  
 
end