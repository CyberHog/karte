  user = User.create(
    avatar: File.open("./db/seeds/development/reprana.jpg"),
    last_name: "佐々木",
    first_name: "小次郎",
    phone: "0334124499",
    email: "kojiro@example.com",
    birthday: "1978-12-01",
    gender: 0,
    practice: true,
    password: "password",
    password_confirmation: "password"
    )
    Address.create(
        user: user,
        postcode: "1540004",
        prefecture: "東京都",
        city: "世田谷区太子堂",
        street: "2-16-8",
        building: "AKビル5F"
        )
user.skip_confirmation!
user.save!

 user = User.create(
    last_name: "井上",
    first_name: "良太",
    phone: "0333560558",
    email: "komori@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: true,
    password: "password",
    password_confirmation: "password"
    )
    Address.create(
        user: user,
        postcode: "2110063",
        prefecture: "東京都",
        city: "新宿区新宿",
        street: "3-12-7",
        building: ""
        )
user.skip_confirmation!
user.save!

user = User.create(
    avatar: File.open("./db/seeds/development/SAMURAI.png"),
    last_name: "侍",
    first_name: "太郎",
    phone: "0357909039",
    email: "samurai@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: true,
    password: "password",
    password_confirmation: "password"
    )
    Address.create(
        user: user,
        postcode: "1530044",
        prefecture: "東京都",
        city: "目黒区大橋",
        street: "2-3-5",
        building: "Ohashi235 5F"
        )
user.skip_confirmation!
user.save!

  user = User.create(
    avatar: File.open("./db/seeds/development/member1.jpg"),
    last_name: "佐藤",
    first_name: "太郎",
    phone: "09012345678",
    email: "taro@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: false,
    password: "password",
    password_confirmation: "password"
    )
user.skip_confirmation!
user.save!

  user = User.create(
    avatar: File.open("./db/seeds/development/skull-2723063_1920.jpg"),
    last_name: "山田",
    first_name: "二郎",
    phone: "09012345678",
    email: "jiro@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: false,
    password: "password",
    password_confirmation: "password"
    )
user.skip_confirmation!
user.save!

  user = User.create(
    avatar: File.open("./db/seeds/development/waraji.jpg"),
    last_name: "鈴木",
    first_name: "花子",
    phone: "09012345678",
    email: "hanako@example.com",
    birthday: "1981-12-01",
    gender: 1,
    practice: false,
    password: "password",
    password_confirmation: "password"
    )
user.skip_confirmation!
user.save!

 user = User.create(
    avatar: File.open("./db/seeds/development/laptop-2838921_1920.jpg"),
    last_name: "代々木",
    first_name: "上原",
    phone: "09012345678",
    email: "yoyogi@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: false,
    password: "password",
    password_confirmation: "password"
    )
user.skip_confirmation!
user.save!
