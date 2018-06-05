table_names = %w(users clinics medical_charts menus notices staffs clinic_cards patients_receipts receipts karte_menus coupons)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end
