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