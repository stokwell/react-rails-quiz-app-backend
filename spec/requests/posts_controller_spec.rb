require 'rails_helper' 

RSpec.describe "PostsController", :type => :request  do 

  it 'sends a list of posts' do 
    FactoryGirl.create_list(:post, 10)

    get '/api/posts'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(10)
  end 

  it 'sends a specific post' do
    post = FactoryGirl.create(:post)    
    
    get "/api/posts/#{post.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json['private_attr']).to eq(nil)
  end

  it 'creates a new post' do
    post '/api/posts', :post => { :title => "New Post", :body => "New Body" }

    expect(response).to be_success

  end 

  it 'deletes a specific post' do
    post = FactoryGirl.create(:post)  

    delete "/api/posts/#{post.id}"

    expect(response).to be_success
  end
 
end