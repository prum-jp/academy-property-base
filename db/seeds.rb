require 'csv'
MODEL = [Agent, Amenity, Area, Holiday, Inquiry, Like, NearStation, Property, User, Municipality, Station, Line]
AGENTS = 1..5
PROPERTIES = 1..20
AREAS = [
  ["東京都","新宿区"],
]
NEAR_STATIONS = [
  ["JR山手線", "新宿"],
  ["JR山手線", "新大久保"],
  ["西武新宿線", "高田馬場"],
  ["都営大江戸線", "都庁前"],
  ["都営新宿線", "曙橋"]
]
USERS = 1..10
INQUIRIES = 1..5

# active storageに格納する物件画像を6枚用意
PROPERTY_PICTURES = []
6.times do |n|
  default_property_picture_path = Rails.root.join("app/assets/images/property#{n + 1}.jpeg")
  default_property_picture_blob = ActiveStorage::Blob.create_and_upload!(
    io: File.open(default_property_picture_path),
    filename: "property#{n + 1}.jpeg",
    content_type: "image/jpeg"
  )
  PROPERTY_PICTURES << default_property_picture_blob
end

begin
  # 実行時にデータ削除
  MODEL.each do |m|
    m.all.destroy_all
  end

  p "agent begin"
  # Agents
  AGENTS.each do |n|
    start_time = rand(7..12)
    end_time = start_time + 8
    Agent.create!(
      auth0_id: n,
      name: "株式会社PRUM Agent-#{n}",
      postal_code: "123456#{n}",
      address: "東京都新宿区西早稲田3丁目31番11号 ニューライフ西早稲田ビル 別館5階 Agent-#{n}",
      phone_number: "123456789#{n}",
      email: "agent#{n}@example.com",
      password_digest: 'Password1234',
      start_at: Time.parse("2024-01-01 #{start_time}:00:00"),
      end_at: Time.parse("2024-01-01 #{end_time}:00:00")
    )
  end
  p "agent end"

  p "property begin"
  # Properties
  PROPERTIES.each do |n|
    Agent.all.each do |agent|
      property = Property.create!(
        agent_id: agent.id,
        name: "Agent-#{agent.id}マンション-#{n}",
        rent: rand(50..100) * 1000,
        deposit: rand(50..100) * 1000,
        honorarium: rand(10..50) * 1000,
        management_fee: rand(1..10) * 1000,
        layout: '1LDK',
        property_type: rand(0..2),
        build_date: Date.new(2020, 1, 1)
      )
      # 一度レコード作成した後に画像を6枚登録
      update_property = Property.find(Property.count)
      PROPERTY_PICTURES.each do |pic|
        update_property.property_images.attach(pic)
      end
    end
  end
  p "property end"

  p "amenity begin"
  # Amenities
  Property.all.each do |property|
    Amenity.create!(
      property_id: property.id,
      parking: [true, false].sample,
      bath: [true, false].sample,
      wash_machine: [true, false].sample,
      aircon: [true, false].sample,
      lock: [true, false].sample
    )
  end
  p "amenity end"

  p "area begin"
  # Areas
  Property.all.each do |property|
    address = AREAS.sample
    Area.create!(
      property_id: property.id,
      prefecture: address[0],
      city: address[1]
    )
  end
  p "area end"

  p "holiday begin"
  # Holidays
  Agent.all.each do |agent|
    Holiday.create!(
      agent_id: agent.id,
      mon: [true, false].sample,
      tue: [true, false].sample,
      wed: [true, false].sample,
      thu: [true, false].sample,
      fri: [true, false].sample,
      sat: [true, false].sample,
      sun: [true, false].sample,
      national_holiday: [true, false].sample
    )
  end
  p "holiday end"

  p "near_station begin"
  # Near Stations
  Property.all.each do |property|
    3.times do
      near_station = NEAR_STATIONS.sample
      NearStation.create!(
        property: property,
        line: near_station[0],
        name: near_station[1],
        minute_walk: rand(1..10)
      )
    end
  end
  p "near_station end"

  p "user begin"
  # Users
  USERS.each do |n|
    User.create!(
      auth0_id: "auth0-#{n}",
      email: "user#{n}@example.com",
      address: "東京都新宿区西早稲田3丁目31番11号 ニューライフ西早稲田ビル 別館5階 User-#{n}",
      postal_code: "2000001",
      phone_number: "9876543219",
      password_digest: 'Password1234',
      last_name: "田中",
      first_name: "太郎"
    )
  end
  p "user end"

  p "inquiry begin"
  # Inquiries
  INQUIRIES.each do |n|
    User.all.each do |user|
      Agent.all.each do |agent|
        Inquiry.create!(
          user_id: user.id,
          agent_id: agent.id,
          last_name: user.last_name,
          first_name: user.first_name,
          email: user.email,
          phone_number: user.phone_number,
          inquiry_type: rand(1..3),
          contents: "userId-#{user.id}のagentId-#{agent.id}に対する問合せ#{Inquiry.count + 1}",
          is_replied: [true, false].sample
        )
      end
    end
  end
  p "inquiry end"

  p "like begin"
  # Likes
  User.all.each do |user|
    Property.all.each do |property|
      Like.create!(
        user_id: user.id,
        property_id: property.id
      )
    end
  end
  p "like end"

  p "municipality begin"
  # Municipalities
  municipality_csv_file_path = 'app/assets/csv/municipalities.csv'
  CSV.foreach(municipality_csv_file_path, headers: true) do |row|
    Municipality.create!(row.to_hash)
  end
  p "municipality end"

  p "line begin"
  line_csv_file_path = 'app/assets/csv/line.csv'
  CSV.foreach(line_csv_file_path, headers: true) do |row|
    Line.create!(row.to_hash)
  end
  p "line end"

  p "station begin"
  station_csv_file_path = 'app/assets/csv/station.csv'
  CSV.foreach(station_csv_file_path, headers: true) do |row|
    Station.create!(row.to_hash)
  end
  p "station end"
rescue StandardError => e
  puts(e.message)
else
  puts('Complete!!')
end