names = %w( Jiro Hana John Mike Sophy Bill Alex Mary Tom)
lnames = ["", "鈴木", "高橋", "田中"]
gnames = ["", "次郎", "花子"]
0.upto(9) do |idx|
  user = User.create(
    user_name: "Taro",
    last_name: "佐藤",
    first_name: "太郎",
    phone: "09012345678",
    email: "taro@example.com",
    birthday: "1981-12-01",
    gender: 0,
    business: (idx == 0),
    password: "password",
    password_confirmation: "password",
    avatar: File.open("./db/seeds/development/member1.jpg")
    )
end

