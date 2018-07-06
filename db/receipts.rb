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