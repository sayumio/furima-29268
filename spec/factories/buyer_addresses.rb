FactoryBot.define do
  factory :buyer_address do
    post_code       { '123-4567' }
    prefectures_id    { '2' }
    city              { 'テスト' }
    block             { '1-1-1' }
    building          { 'テスト' }
    phone_num         { '09012345678' }
    token             { 'aaaaa' }
  end
end
