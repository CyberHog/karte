  user = User.create(
    last_name: "佐藤",
    first_name: "太郎",
    phone: "09012345678",
    email: "taro@example.com",
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

