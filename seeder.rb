Group.destroy_all
User.destroy_all

groups = {}

groups["cb"] = Group.create!(
  description: "Charlottenburg (w/ car)",
  route: "Bla",
  leave_from: "Le Labo",
  leave_at: Time.new(2014, 6, 15, 19, 00),
  circle_center_lat: 52.517891,
  circle_center_long: 13.300171,
  circle_radius: 2700)

groups["nk"] = Group.create!(
  description: "Neukölln Crew",
  route: "Bla",
  leave_from: "Le Labo",
  leave_at: Time.new(2014, 6, 15, 19, 00),
  circle_radius: 500)

groups["wedding"] = Group.create!(
  description: "Wedding Crew",
  route: "Bla",
  leave_from: "Le Labo",
  leave_at: Time.new(2014, 6, 15, 19, 00),
  circle_radius: 500)

groups["hbf"] = Group.create!(
  description: "Hauptbahnhof Crew",
  route: "Bla",
  leave_from: "Le Labo",
  leave_at: Time.new(2014, 6, 15, 19, 00),
  circle_center_lat: 52.525592,
  circle_center_long: 13.369545,
  circle_radius: 2700)

groups["fh"] = Group.create!(
  description: "Friedrichshain Crew",
  route: "Bla",
  leave_from: "Le Labo",
  leave_at: Time.new(2014, 6, 15, 19, 00),
  circle_radius: 500)

csv = <<-eof
Lukas I.,lukas-ingelheim.jpg,Geschichtspark Moabit,hbf
Nima C.,nima-caspian.jpg,Europaplatz 2,hbf
Dan R.,dan-romescu.jpg,Berlin Hbf,hbf
Heiko B.,heiko-bucher.jpg,Washingtonplatz,hbf
Conor R.,conor-roche.jpg,"Höchstestr. 10, 10249, Berlin",fh
Martin G.,martin-gerner.jpg,"Höchstestr. 15, 10249, Berlin",fh
James S.,james-sugrue.jpg,"Höchstestr. 20, 10249, Berlin",fh
Sean O.S.,sean-osullivan.jpg,"Höchstestr. 5, 10249, Berlin",fh
Timotius S.,timotius-sakti.jpg,bayernallee 2,cb
Silvia S.,silvia-sakti.jpg,theodor heuss platz 3,cb
Faisal M.,faisal-moeen.jpg,Savigny Platz,cb
Janani C.,janani-chakkaradhari.jpg,reichsstr 103,cb
Jose P.,jose-pino.jpg,soorstr 26,cb
Takayuki S.,takayuki-sato.jpg,Sonnenallee 138,nk
Alec H.,alec-hanefeld.jpg,Rollbergstr. 1,nk
Alex K.,alexander-koenig.jpg,Flughafenstr. 7,nk
Christian J.,christian-jennwer.jpg,Weserstr. 37 Berlin,nk
Luis F.,luis-fernandez.jpg,Stettiner Str. 25,wedding
Luisa M.,luisa-maier.jpg,"Lychener Straße 19, 10",wedding
Darja G.,darja-gutnick.jpg,Erich-Weinert-Str. 135,wedding
Jasper T.,jasper-timm.jpg,Brunnenplatz,wedding
eof

require "csv"

users = CSV.parse(csv, headers: false)

users.each do |user|
  sleep 1
  User.create!(
    name: user[0],
    profile_image:user[1],
    group: groups[user[3]],
    leave_after: Time.new(2014, 6, 15, 18, 00),
    leave_before: Time.new(2014, 6, 15, 20, 00),
    destination_address: user[2],
  )
end

User.create!(
  name: "Mr. Demo",
  profile_image: "empty.jpg",
  destination_address: "brandenburger tor",
  group: groups["hbf"],
  leave_after: Time.new(2014, 6, 15, 18, 00),
  leave_before: Time.new(2014, 6, 15, 20, 00))


