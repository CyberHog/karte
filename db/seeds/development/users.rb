  user = User.create(
    avatar: File.open("./db/seeds/development/member1.jpg"),
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

  user = User.create(
    avatar: File.open("./db/seeds/development/skull-2723063_1920.jpg"),
    last_name: "山田",
    first_name: "二郎",
    phone: "09012345678",
    email: "jiro@example.com",
    birthday: "1981-12-01",
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
        building: "AKビル 5F"
        )

  user = User.create(
    avatar: File.open("./db/seeds/development/waraji.jpg"),
    last_name: "鈴木",
    first_name: "花子",
    phone: "09012345678",
    email: "hanako@example.com",
    birthday: "1981-12-01",
    gender: 1,
    practice: true,
    password: "password",
    password_confirmation: "password"
    )
    Address.create(
        user: user,
        postcode: "1540004",
        prefecture: "東京都",
        city: "世田谷区三軒茶屋",
        street: "3-5-2",
        building: ""
        )

  user = User.create(
    avatar: File.open("./db/seeds/development/laptop-2838921_1920.jpg"),
    last_name: "佐々木",
    first_name: "小次郎",
    phone: "09012345678",
    email: "kojiro@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: true,
    password: "password",
    password_confirmation: "password"
    )
    Address.create(
        user: user,
        postcode: "3410018",
        prefecture: "埼玉県",
        city: "三郷早稲田",
        street: "5-5-26",
        building: "ライオンズマンション三郷市第五 1101"
        )
