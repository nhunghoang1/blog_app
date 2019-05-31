FactoryBot.define do
  factory :comment do
    user
    article
    body { 'This is the body of a comment'}
  end
end