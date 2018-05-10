# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#CHARITY CREATION (COUNT: 3)
User.create(
  email: 'charityone@email.com',
  password: 'passwordone',
  chosen_role: 'charity',
  business_name: 'Beyond Blue',
  bio: 'We work to help Mental Illness.',
  phone: '1300 22 4636',
  street: '18 Charlotte Street',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4000',
  remote_image_url: 'https://pbs.twimg.com/profile_images/880262079126556672/ZcUEqQhC_400x400.jpg'
)

User.create(
  email: 'charitytwo@email.com',
  password: 'passwordtwo',
  chosen_role: 'charity',
  business_name: 'Australian Koala Foundation',
  bio: 'A brisbane based charity focused on saving cute Koalas.',
  phone: '07 3229 7233',
  street: '40 Charlotte Street',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4000',
  remote_image_url: 'https://www.savethekoala.com/sites/savethekoala.com/files/uploads/logo/logo-akf-small-3d.png'
)

User.create(
  email: 'charitythree@email.com',
  password: 'passwordthree',
  chosen_role: 'charity',
  business_name: 'EverydayHero',
  bio: 'Helping Not-For-Profits by online fundraising.',
  phone: '07 3838 3838',
  street: '333 Ann Street',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4000',
  remote_image_url: 'https://i0.wp.com/anotherjennifer.com/wp-content/uploads/2014/05/everydayhero.jpg'
)

# VOLUNTEER CREATE (COUNT 5)
user =  User.create(
  email: 'jordanandrewmorris1@gmail.com',
  password: 'password',
  chosen_role: 'volunteer',
  first_name: 'Jordan',
  last_name: 'Morris',
  bio: 'I am a twenty-three year old web development student',
  phone: '0431118798',
  street: '16 Woolcock Street',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4000',
  remote_image_url: 'https://scontent.fbne5-1.fna.fbcdn.net/v/t1.0-9/18839230_919471018195235_2269214241441016113_n.jpg?_nc_cat=0&oh=1394d60d2448f7473b78d829eb136f9f&oe=5B94971C',
  skills: [
    Skill.create({name: "Reading"}),
    Skill.create({name: "Software Development"}),
    Skill.create({name: "Personal Finance"})
]
)

user = User.create(
  email: 'clarestrongman@hotmail.com',
  password: 'password',
  chosen_role: 'volunteer',
  first_name: 'Clare',
  last_name: 'Strongman',
  bio: 'I really like science and helping people.',
  phone: '0415370044',
  street: '54 Victoria Street',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4000',
  remote_image_url: 'https://scontent.fbne5-1.fna.fbcdn.net/v/t1.0-9/13428513_10153796298628510_5525896659966173410_n.jpg?_nc_cat=0&oh=346c031e3b18216d54a41a189de6c4e3&oe=5B9789AD',
  skills: [
    Skill.create({name: "Science"}),
    Skill.create({name: "Petting Cats"}),
    Skill.create({name: "Cuddling Cats"})
]
)

user = User.create(
  email: 'glenpearce@mail.com',
  password: 'password',
  chosen_role: 'volunteer',
  first_name: 'Glen',
  last_name: 'Pearce',
  bio: 'A young musician looking to help the community through audio.',
  phone: '0431333333',
  street: '53 Baroona Road',
  city: 'Australia',
  country: 'Australia',
  postcode: '4064',
  remote_image_url: 'https://scontent.fbne5-1.fna.fbcdn.net/v/t1.0-9/12794415_10153924484619029_5712528431469762721_n.jpg?_nc_cat=0&oh=ddddd9ec7024c9ab54bb8c18730ce958&oe=5B961139',
  skills: [
    Skill.create({name: "Singing"}),
    Skill.create({name: "Guitar"}),
    Skill.create({name: "Dancing"})
]
)

user = User.create(
  email: 'cjones@mail.com',
  password: 'password',
  chosen_role: 'volunteer',
  first_name: 'Clare',
  last_name: 'Jones',
  bio: 'I like helping people even more than I like food and clothes.',
  phone: '0441 444 444',
  street: '10 Wilston Road',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4051',
  remote_image_url: 'https://scontent.fbne5-1.fna.fbcdn.net/v/t1.0-9/26219266_10215071959177928_3904250392346412240_n.jpg?_nc_cat=0&oh=3ecb3613e37a804068f746f22ea52604&oe=5B592D28',
  skills: [
    Skill.create({name: "Drawing"}),
    Skill.create({name: "Eating"}),
    Skill.create({name: "Sleeping"})
]
)

user = User.create(
  email: 'nathannorris@mail.com',
  password: 'password',
  chosen_role: 'volunteer',
  first_name: 'Nathan',
  last_name: 'Norris',
  bio: 'A professional volunteer.',
  phone: '0444555555',
  street: '11 Monro Street',
  city: 'Brisbane',
  country: 'Australia',
  postcode: '4059',
  remote_image_url: 'https://scontent.fbne5-1.fna.fbcdn.net/v/t1.0-9/19510269_10209824666429632_320617566554035735_n.jpg?_nc_cat=0&oh=9d151578562510a6f624dec834943bb5&oe=5B84C1CB',
  skills: [
    Skill.create({name: "Consultancy"}),
    Skill.create({name: "Playing Switch"}),
    Skill.create({name: "Watching SBS"})
]
)


# JOBS CREATION (COUNT 9)

  Job.create(
    user_id: 2,
    name: "Kool Koalas",
    description: "An event in Brisbane to celebrate Koalas.",
    street: '40 Charlotte Street',
    city: 'Brisbane',
    country: 'Australia',
    postcode: '4000',
    volunteers_needed: 1)
  Job.create(
        user_id: 2,
    name: "Visit The Koalas",
    description: "Need volunteers to chaperone guests around venue space.",
    street: '40 Charlotte Street',
    city: 'Brisbane',
    country: 'Australia',
    postcode: '4000',
    volunteers_needed: 2)
  Job.create(
        user_id: 2,
    name: "Awareness Campaign",
    description: "An event to raise awareness for our cause.",
    street: '40 Charlotte Street',
    city: 'Brisbane',
    country: 'Australia',
    postcode: '4000',
    volunteers_needed: 2)
      Job.create(
            user_id: 1,
        name: "Charity Fundraiser",
        description: "An event in Brisbane to raise funds.",
        street: '18 Charlotte Street',
        city: 'Brisbane',
        country: 'Australia',
        postcode: '4000',
        volunteers_needed: 3 )
      Job.create(
        user_id: 1,
        name: "Awareness Campaign",
        description: "An event to raise awareness for our cause.",
        street: '18 Charlotte Street',
        city: 'Brisbane',
        country: 'Australia',
        postcode: '4000',
        volunteers_needed: 2 )
      Job.create(
        user_id: 1,
        name: "Happy Birthday Bean",
        description: "An event in Brisbane to help celebrate Bean's birthday and make him feel like a champ.",
        street: '18 Charlotte Street',
        city: 'Brisbane',
        country: 'Australia',
        postcode: '4000',
        volunteers_needed: 3)

          Job.create(
            user_id: 3,
            name: "How to Fundraise",
            description: "An information night to educate people on fundraising. Need three people.",
            street: '333 Ann Street',
            city: 'Brisbane',
            country: 'Australia',
            postcode: '4000',
            volunteers_needed: 3)
          Job.create(
            user_id: 3,
            name: "Charity Fundraisers",
            description: "Need volunteers to chaperone guests around venue space.",
            street: '333 Ann Street',
            city: 'Brisbane',
            country: 'Australia',
            postcode: '4000',
            volunteers_needed: 3)
          Job.create(
            user_id: 3,
            name: "Charity Event",
            description: "I've run out of ideas lets face it.",
            street: '333 Ann Street',
            city: 'Brisbane',
            country: 'Australia',
            postcode: '4000',
            volunteers_needed: 1)
