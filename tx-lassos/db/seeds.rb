# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  {
    first_name: 'Alix',
    last_name: 'Morrow',
    street: '123 Something St.',
    city: 'Austin',
    state: 'Texas',
    zip_code: '78701',
    phone: '512-555-1234',
    email: 'alix@alixcompany.com',
    password_hash: 'H87ywh87L0',
    marital_status: 'Single',
    occupation: 'Strategic Planner',
    major: 'Advertising',
    pledge_year: '1998',
    pledge_class_name: 'Founder',
    grad_year: '2002',
    facebook: 'AlixMorrow',
    twitter: '@alixmorrrow',
    instagram: '',
    linkedin: 'https://www.linkedin.com/pub/alix-morrow/2/702/4aa',
    pinterest: '',
    comments: 'These are comments. They are awesome. Hurray!',
    admin: true
  },
  {
    first_name: 'Texas',
    last_name: 'Girl',
    street: '888 Thing Place',
    city: 'Austin',
    state: 'Texas',
    zip_code: '78704',
    phone: '512-555-4321',
    email: 'girl@texas.com',
    password_hash: 'ABhdg2654sg',
    marital_status: 'Married',
    occupation: 'Biologist',
    major: 'Biop-scientist',
    pledge_year: 'Spring 2005',
    pledge_class_name: 'Sassy Six Shooters',
    grad_year: '2002',
    facebook: 'TexasGirl',
    twitter: '@texasgirl',
    instagram: 'www.instagram.com/texasgirl',
    linkedin: 'www.linkedin.com/pub/texas-girl/dsghsdhg',
    pinterest: 'www.pinterest.com/texas-girl',
    comments: 'These are comments. They are awesome. Hurray!',
    admin: false
  },
  {
    first_name: 'Tejas',
    last_name: 'Senorita',
    street: '777 Bueno Real',
    city: 'Austin',
    state: 'Texas',
    zip_code: '78757',
    phone: '512-555-9999',
    email: 'senorita@tejas.com',
    password_hash: '897y6342gdsf2HAge',
    marital_status: 'Divorced',
    occupation: 'Lawyer',
    major: 'Pre-law',
    pledge_year: '2001',
    pledge_class_name: 'Crazy Cowgirls',
    grad_year: '2005',
    facebook: 'TejasSenorita',
    twitter: '@tejas-senorita',
    instagram: '',
    linkedin: '',
    pinterest: 'www.pinterest.com/tejassenorita',
    comments: 'These are comments. They are awesome. Hurray!',
    admin: false
  }
])
