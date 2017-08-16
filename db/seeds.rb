require "random_data"

50.times do
    
    Post.create!(
        
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end



post = Post.all

100.times do

    
    Comment.create!(
        
        post: post.sample,
        body: RandomData.random_paragraph
        )
end



Post.find_or_create_by(
    
    title: "Hello title",
    body: "My friend you created me."
    )

Comment.find_or_create_by(
    post: Post.find_or_create_by(title: "Hello title"),
    body: "I have been made."
    )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
