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
        building: "ライオンズマンション三郷第五 1101"
        )
    Clinic.create(
        user: user,
        name: "リプラーナ整骨鍼灸院",
        hp_url: "https://www.reprana.com/"
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
    last_name: "武蔵",
    first_name: "小杉",
    phone: "09012345678",
    email: "kosugi@example.com",
    birthday: "1981-12-01",
    gender: 0,
    practice: true,
    password: "password",
    password_confirmation: "password"
    )
    Address.create(
        user: user,
        postcode: "2110063",
        prefecture: "神奈川県",
        city: "川崎市中原区小杉町",
        street: "3-492",
        building: ""
        )
    Clinic.create(
        user: user,
        name: "小守スポーツマッサージ療院",
        hp_url: "http://www.jta-komori.com/"
        )
user.skip_confirmation!
user.save!

 user = User.create(
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
