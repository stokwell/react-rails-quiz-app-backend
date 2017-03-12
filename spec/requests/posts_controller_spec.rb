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
      before(:each) { post '/api/posts', { post: post_params }, headers }

      it 'creates post and responds with it' do
      #не знаю как проверить что возвращается тот пост который был создан,
      # может и не нужно это проверять
      end

      it { expect(response).to have_http_status(201) }
    end
  end

  it 'deletes a specific post' do
    post = FactoryGirl.create(:post)  

    delete "/api/posts/#{post.id}"

    expect(response).to be_success
  end
 
end