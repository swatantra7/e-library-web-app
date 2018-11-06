# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = ['Classic Books', 'Biographies', 'Romance', 'Kids', 'Thrillers', 'Textbooks']
categories.each do |category_name|
  cat = Category.find_or_initialize_by(name: category_name)
  if cat.save
    puts "category #{category_name} save successfully"
  else
    puts "category #{category_name} Does not saved due to errors #{cat.errors.full_messages.join(' ')}"
  end
end

subjects = ['ART']

subjects.each do |subject_name|
  sub = Subject.find_or_initialize_by(name: subject_name)
  if sub.save
    puts "subject #{subject_name} save successfully"
  else
    puts "subject #{subject_name} Does not saved due to errors #{sub.errors.full_messages.join(' ')}"
  end
end