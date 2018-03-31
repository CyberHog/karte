names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
lnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
0.upto(9) do |idx|
  user = User.create(
    user_name: names[idx],
    last_name: "#{lnames[idx % 4]}",
    first_name: "#{gnames[idx % 3]}",
    phone: "09012345678",
    email: "#{names[idx]}@example.com",
    birthday: "1981-12-01",
    gender: [0, 0, 1][idx % 3],
    business: (idx == 0),
    password: "password",
    password_confirmation: "password",
    avatar: File.open("./db/seeds/development/member1.jpg")
    )
end
0.upto(15) do |idx|
    User.create(
        user_name: "John#{idx + 1}",
        last_name: "John#{idx + 1}",
        first_name: "Doe#{idx + 2}",
        phone: "09012345678",
        email: "John#{idx + 1}@example.com",
        birthday: "1981-12-01",
        gender: 0,
        business: false,
        password: "password",
        password_confirmation: "password",
        avatar: File.open("./db/seeds/development/member2.jpg")
        )
end
