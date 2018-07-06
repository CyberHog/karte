  user = User.create(
    avatar: File.open("./db/reprana.jpg"),
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
    avatar: File.open("./db/SAMURAI.png"),
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
    avatar: File.open("./db/member1.jpg"),
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
    avatar: File.open("./db/skull-2723063_1920.jpg"),
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
    avatar: File.open("./db/waraji.jpg"),
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
    avatar: File.open("./db/laptop-2838921_1920.jpg"),
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


clinic = Clinic.new(
    name: "リプラーナ整骨鍼灸院",
    hp_url: "https://www.reprana.com/"
    )
user = User.first
clinic.owner = user
clinic.save!

clinic = Clinic.new(
    name: "小守スポーツマッサージ療院",
    hp_url: "http://www.jta-komori.com/"
    )
user = User.second
clinic.owner = user
clinic.save!


clinic_card = ClinicCard.create(
    publisher_id: "1",
    holder_id: "4",
    holding_point: "3000",
    number: "1234"
    )

clinic_card = ClinicCard.create(
    publisher_id: "2",
    holder_id: "4",
    holding_point: "0",
    number: "A0001"
    )

clinic_card = ClinicCard.create(
    publisher_id: "1",
    holder_id: "5",
    holding_point: "0",
    number: "1235"
    )

clinic_card = ClinicCard.create(
    publisher_id: "2",
    holder_id: "5",
    holding_point: "0",
    number: "A0002"
    )

clinic_card = ClinicCard.create(
    publisher_id: "1",
    holder_id: "6",
    holding_point: "0",
    number: "1236"
    )

clinic_card = ClinicCard.create(
    publisher_id: "2",
    holder_id: "6",
    holding_point: "0",
    number: "A0005"
    )

follow = Follow.create(
    followable_type: "User",
    followable_id: 4,
    follower_type: "User",
    follower_id: 1
    )
follow = Follow.create(
    followable_type: "User",
    followable_id: 5,
    follower_type: "User",
    follower_id: 1
    )



staff = Staff.create(
    user_id: "1",
    staff_number: "1",
    staff_name: "坂岡",
    staff_suspension: false
    )
staff = Staff.create(
    user_id: "1",
    staff_number: "2",
    staff_name: "鈴木",
    staff_suspension: false
    )
staff = Staff.create(
    user_id: "1",
    staff_number: "3",
    staff_name: "佐藤",
    staff_suspension: false
    )
staff = Staff.create(
    user_id: "1",
    staff_number: "4",
    staff_name: "松本",
    staff_suspension: true
    )
staff = Staff.create(
    user_id: "2",
    staff_number: "1",
    staff_name: "笑福亭",
    staff_suspension: false
    )
staff = Staff.create(
    user_id: "2",
    staff_number: "2",
    staff_name: "春風亭",
    staff_suspension: false
    )
staff = Staff.create(
    user_id: "2",
    staff_number: "3",
    staff_name: "一刻堂",
    staff_suspension: false
    )

medical_chart = MedicalChart.create(
    therapist_id: "1",
    patient_id: "4",
    card_number: "1234",
    visited_at: "2018-5-14",
    service: "整体",
    staff_name: "鈴木",
    cc: "背部痛",
    tx_comment: "背骨を全体的に調節していきました。
骨盤の歪みが酷かったのですが、過去にひどい捻挫をされているようで、右の足首の緩さが骨盤に影響し、そのまま背部の骨の歪みに繋がっていました。
足首周りのリハビリと、骨盤、背部の矯正を定期的に行なっていきましょう。",
    comment: "また来週お待ちしております。"
    )

medical_chart = MedicalChart.create(
    therapist_id: "1",
    patient_id: "5",
    card_number: "1235",
    visited_at: "2018-5-22",
    staff_name: "佐藤",
    cc: "腰部痛",
    tx_comment: "腰部から臀部、下肢を中心に施術を行いました。
    右腰の痛みと、右下肢の痺れがひどく出ていたので、L4,L5、右臀部、坐骨神経のラインに鍼とお灸をしました。
    施術後には痛みが４割まで消失しました。まだ若干のしびれと痛みが残るので、間を空けないようにいらしてください。",
    comment: "また明日お待ちしております。"
    )

medical_chart = MedicalChart.create(
    therapist_id: "2",
    patient_id: "6",
    card_number: "A0005",
    visited_at: "2018-4-29",
    staff_name: "笑福亭",
    cc: "腹部の痩身",
    tx_comment: "腹部周りの脂肪を中心に揉みほぐしていきました。長年溜め込んだ脂肪がかなり固まっておりましたが、90分でなんとかほぐれてきました。
    この塊がよりほぐれることで腹部の部分痩せがスムーズに行えます。次回は骨の歪みも整えてより美しくなりましょう。",
    comment: "また来週お待ちしております。"
    )

karte_menu = KarteMenu.create(
    medical_chart_id: "1",
    course: "整体"
    )

karte_menu = KarteMenu.create(
    medical_chart_id: "2",
    course: "鍼60"
    )

karte_menu = KarteMenu.create(
    medical_chart_id: "3",
    course: "オイルマッサージ90分"
    )

menu = Menu.create(
    user_id: "1",
    content_id: "1",
    content_name: "マッサージ30分",
    price: "3000",
    attached_point: "30",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "2",
    content_name: "マッサージ45分",
    price: "4500",
    attached_point: "45",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "3",
    content_name: "マッサージ60分",
    price: "6000",
    attached_point: "60",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "4",
    content_name: "鍼30分",
    price: "3000",
    attached_point: "30",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "5",
    content_name: "鍼45分",
    price: "4500",
    attached_point: "45",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "6",
    content_name: "鍼60分",
    price: "6000",
    attached_point: "60",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "7",
    content_name: "整体",
    price: "6000",
    attached_point: "60",
    coupon: false
    )
menu = Menu.create(
    user_id: "1",
    content_id: "8",
    content_name: "回数券購入(60分×6回分)",
    price: "30000",
    attached_point: "300",
    coupon: true,
    counting: 6,
    validity_period: "180"
    )
menu = Menu.create(
    user_id: "1",
    content_id: "9",
    content_name: "回数券利用(60分)",
    price: "0",
    attached_point: "0",
    coupon: true,
    counting: 0,
    validity_period: "0",
    coupon_number: "8",
    usage: "1"
    )
menu = Menu.create(
    user_id: "1",
    content_id: "10",
    content_name: "回数券購入(30分×12回分)",
    price: "30000",
    attached_point: "300",
    coupon: true,
    counting: 12,
    validity_period: "180"
    )
menu = Menu.create(
    user_id: "1",
    content_id: "11",
    content_name: "回数券利用(30分)",
    price: "0",
    attached_point: "0",
    coupon: true,
    counting: 0,
    validity_period: "0",
    coupon_number: "10",
    usage: "1"
    )
menu = Menu.create(
    user_id: "2",
    content_id: "1",
    content_name: "美容鍼",
    price: "8000",
    attached_point: "80",
    coupon: false
    )
menu = Menu.create(
    user_id: "2",
    content_id: "2",
    content_name: "美容整体",
    price: "10000",
    attached_point: "100",
    coupon: false
    )
menu = Menu.create(
    user_id: "2",
    content_id: "3",
    content_name: "オイルマッサージ90分",
    price: "15000",
    attached_point: "150",
    coupon: false
    )
menu = Menu.create(
    user_id: "2",
    content_id: "4",
    content_name: "回数券購入(美容整体×6回分)",
    price: "50000",
    attached_point: "500",
    coupon: true,
    counting: 6,
    validity_period: "210"
    )

body = 
    "こんにちは、生憎の雨模様となりましたね。\n" +
    "本日、自費治療を受けて頂いた方限定！" +
  "お会計時１０％OFFとなります。" +
  "ご予約はお早めに！。"
%w(佐々木 井上 侍).each do |name|
  user = User.find_by(last_name: name)
  0.upto(9) do |idx|
    Notice.create(
      author: user,
      title: "雨の日キャンペーン#{idx}",
      body: body,
      released_at: 10.days.ago.advance(days: idx),
      status: %w(draft member_only public)[idx % 3])
  end
end

patients_receipt = PatientsReceipt.create(
    seller_id: "1",
    buyer_id: "4",
    clinic_card_id: "1",
    payday: "2018-05-14",
    payer: "佐藤　太郎" 
    )

patients_receipt = PatientsReceipt.create(
    seller_id: "1",
    buyer_id: "4",
    clinic_card_id: "1",
    payday: "2018-05-23",
    payer: "佐藤　太郎" 
    )

patients_receipt = PatientsReceipt.create(
    seller_id: "1",
    buyer_id: "5",
    clinic_card_id: "3",
    payday: "2018-05-22",
    payer: "山田　二郎" 
    )

patients_receipt = PatientsReceipt.create(
    seller_id: "1",
    buyer_id: "4",
    clinic_card_id: "1",
    payday: "2018-06-02",
    payer: "佐藤　太郎" 
    )

receipt = Receipt.create(
    patients_receipt_id: "1",
    service: "整体",
    payment: "6000",
    gained_point: "60",
    payment_method: "現金"
    )

receipt = Receipt.create(
    patients_receipt_id: "2",
    service: "マッサージ60分",
    payment: "6000",
    gained_point: "60",
    payment_method: "カード"
    )

receipt = Receipt.create(
    patients_receipt_id: "3",
    service: "鍼60分",
    payment: "6000",
    gained_point: "60",
    payment_method: "現金"
    )

receipt = Receipt.create(
    patients_receipt_id: "4",
    service: "回数券購入(60分×6回分)",
    payment: "30000",
    gained_point: "300",
    payment_method: "現金"
    )

coupon = Coupon.create(
    patients_receipt_id: "4",
    seller_id: "1",
    buyer_id: "4",
    coupon_name: "回数券購入(60分×6回分)",
    remaining: "1",
    expiration_date: "2018-11-29"
    )
