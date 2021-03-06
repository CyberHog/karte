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