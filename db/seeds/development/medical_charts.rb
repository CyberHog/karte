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
    service: "鍼60",
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
    service: "オイルマッサージ90分",
    staff_name: "笑福亭",
    cc: "腹部の痩身",
    tx_comment: "腹部周りの脂肪を中心に揉みほぐしていきました。長年溜め込んだ脂肪がかなり固まっておりましたが、90分でなんとかほぐれてきました。
    この塊がよりほぐれることで腹部の部分痩せがスムーズに行えます。次回は骨の歪みも整えてより美しくなりましょう。",
    comment: "また来週お待ちしております。"
    )