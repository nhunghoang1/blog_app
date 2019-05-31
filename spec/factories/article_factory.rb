FactoryBot.define do
  factory :article do 
    title { 'A title' }
    text { 'This is the body of an article' }
    user
  end
end