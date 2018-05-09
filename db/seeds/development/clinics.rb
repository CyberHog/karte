
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