# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(name: 'เจ อาร์ วาย พร็อพเพอร์ตี้', credit: 10)
Customer.create(name: 'อิตาเลียนไทยดีเวล็อปเมนต์', credit: 8)
Customer.create(name: 'คอนเซพแลนด์9	', credit: 8)
Customer.create(name: 'อิตาเลียนไทยดีเวล็อปเมนต์', credit: 8)
Customer.create(name: 'ทีซีซีโฮเทลแอสเสทแมนเนจเม้นท์	', credit: 4)


Bill.create(customer: Customer.first, bill_no: "110/01",
            amount: 7087.86, due_date: Date.today)
Bill.create(customer: Customer.first, bill_no: "110/02",
            amount: 134056.00, due_date: Date.today - 5)
Bill.create(customer: Customer.first, bill_no: "110/03",
            amount: 34056.43, due_date: Date.today - 2)

Bill.create(customer: Customer.second, bill_no: "120/01",
            amount: 1147.04, due_date: Date.today)
Bill.create(customer: Customer.second, bill_no: "120/02",
            amount: 26748.48, due_date: Date.today + 1)
Bill.create(customer: Customer.second, bill_no: "120/03",
            amount: 11217.88, due_date: Date.today - 10)