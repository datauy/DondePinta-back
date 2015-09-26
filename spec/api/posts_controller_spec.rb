require 'rails_helper'

describe 'Api::V1::PostsController', type: :request do
  before do
    (1..10).each do |i|
      Post.create(
        title: "Post #{i}",
        body: 'This is the post body'
      )
    end
  end

  it 'Returns all posts' do
    get '/api/v1/posts', format: :json
    expect(response.status).to eq 200
    posts = JSON.parse(response.body)
    expect(posts.count).to eq 10
    expect(posts[0]['title']).to eq 'Post 1'
    expect(posts[0]['body']).to eq 'This is the post body'
  end

  it 'returns a post' do
    id = Post.first.id
    get "/api/v1/posts/#{id}", format: :json
    expect(response.status).to eq 200
    post = JSON.parse(response.body)
    expect(post['title']).to eq 'Post 1'
    expect(post['body']).to eq 'This is the post body'
  end
end
