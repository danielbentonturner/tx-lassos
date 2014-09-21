# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  {
    name: 'Alix Morrow',
    street: '123 Something St.',
    city_state: 'Austin, TX 78701',
    phone: '512-555-1234',
    email: 'alixmorrow@alixcompany.com',
    email2: 'alixmorrow@hotmail.com',
    major: 'Advertising',
    pledge_class: '1998',
    pledge_class_name: 'Founder',
    grad_year: '2002',
    employer: "self",
    job_title: 'Strategic Planner',
    marital_status: 'Single',
    linkedin: 'https://www.linkedin.com/pub/alix-morrow/2/702/4aa',
    facebook: 'AlixMorrow',
    twitter: '@alixmorrrow',
    instagram: '',
    pinterest: '',
    comments: 'These are comments. They are awesome. Hurray!',
    admin: true,
    approved: true,
    password: "stuffnthings",
    password_confirmation: "stuffnthings"
  }
)

