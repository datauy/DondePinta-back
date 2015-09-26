require 'rails_helper'

describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it 'creates a Post' do
    post = Post.create(
      title: 'Test post',
      body: 'This is the post body'
    )
    expect(post.persisted?)
  end
end
