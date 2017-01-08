# Create users

default_password = '12345678'

students = [
  user_1 = User.create!(
    first_name: 'Андрей',
    last_name:  'Емельяненко',
    phone:      '099 082-82-62',
    role:       :student,
    email:      'emelianenko.web@gmail.com',
    password:   default_password
  ),

  user_2 = User.create!(
    first_name: 'Михаил',
    last_name:  'Белоусов',
    phone:      '093 476-32-54',
    role:       :student,
    email:      'michail.belousov@gmail.com',
    password:   default_password
  ),

  user_3 = User.create!(
    first_name: 'Анатолий',
    last_name:  'Климчук',
    phone:      '099 123-45-67',
    role:       :student,
    email:      'anatoliy.klimchuk@gmail.com',
    password:   default_password
  )
]

guardians = [
  user_4 = User.create!(
    first_name: 'Ирина',
    last_name:  'Каменских',
    phone:      '093 407-46-49',
    role:       :guardian,
    email:      'irina.kamenskih@gmail.com',
    password:   default_password
  ),

  user_5 = User.create!(
    first_name: 'Александр',
    last_name:  'Емельяненко',
    phone:      '099 014-32-47',
    role:       :guardian,
    email:      'alex.emelianenko@gmail.com',
    password:   default_password
  ),

  user_6 = User.create!(
    first_name: 'Александр',
    last_name:  'Белоусов',
    phone:      '099 555-12-24',
    role:       :guardian,
    email:      'alex.belousov@gmail.com',
    password:   default_password
  ),

  user_7 = User.create!(
    first_name: 'Лариса',
    last_name:  'Белоусова',
    phone:      '067 982-14-77',
    role:       :guardian,
    email:      'larisa.belousova@gmail.com',
    password:   default_password
  ),

  user_8 = User.create!(
    first_name: 'Владислав',
    last_name:  'Климчук',
    phone:      '093 325-14-99',
    role:       :guardian,
    email:      'vladislav.klimchuk@gmail.com',
    password:   default_password
  ),

  user_9 = User.create!(
    first_name: 'Ирина',
    last_name:  'Климчук',
    phone:      '050 777-22-12',
    role:       :guardian,
    email:      'irina.klimchuk@gmail.com',
    password:   default_password
  )
]

teachers = [
  user_10 = User.create!(
    first_name: 'Валентина',
    last_name:  'Далека',
    phone:      '099 777-77-77',
    role:       :teacher,
    email:      'dalekavd@ukr.net',
    password:   default_password
  ),

  user_11 = User.create!(
    first_name: 'Александр',
    last_name:  'Шейн',
    phone:      '097 322-15-27',
    role:       :teacher,
    email:      'alex.sheyn@gmail.com',
    password:   default_password
  )
]

# Create relations between users

user_1.user_relations.create!(to_user: user_4, relation_type: :mother)
user_1.user_relations.create!(to_user: user_5, relation_type: :father)

user_2.user_relations.create!(to_user: user_6, relation_type: :father)
user_2.user_relations.create!(to_user: user_7, relation_type: :mother)

user_3.user_relations.create!(to_user: user_8, relation_type: :father)
user_3.user_relations.create!(to_user: user_9, relation_type: :mother)

# Create grades

grades = [
  grade_1 = Grade.create!(
    name: '11-А',
    description: 'Класс с уклоном на программирование',
    graduation_year: 2017
  )
]

grade_1.grade_users.create!(user: user_1, relation_type: :student)
grade_1.grade_users.create!(user: user_2, relation_type: :student)
grade_1.grade_users.create!(user: user_3, relation_type: :student)
grade_1.grade_users.create!(user: user_10, relation_type: :teacher)

# Create subjects

subjects = [
  subject_1  = Subject.create!(name: 'Программирование'),
  subject_2  = Subject.create!(name: 'Психология'),
  subject_3  = Subject.create!(name: 'Алгебра'),
  subject_4  = Subject.create!(name: 'Геометрия'),
  subject_5  = Subject.create!(name: 'Физика'),
  subject_6  = Subject.create!(name: 'География'),
  subject_7  = Subject.create!(name: 'Английский язык'),
  subject_8  = Subject.create!(name: 'Русский язык'),
  subject_9  = Subject.create!(name: 'Украинский язык'),
  subject_10 = Subject.create!(name: 'Физкультура'),
  subject_11 = Subject.create!(name: 'История'),
  subject_12 = Subject.create!(name: 'Военная подготовка')
]

subject_1.subject_users.create!(user: user_10, relation_type: :teacher)
subject_1.subject_users.create!(user: user_11, relation_type: :teacher)

# Create schedules

time_now = Time.now
time_limit = Time.now + 2.weeks

25.times {
  subject  = subjects.sample
  grade    = grades.sample
  teacher  = subject.subject_users.teacher.take&.user || teachers.sample
  start_at = rand(time_now..time_limit).beginning_of_hour

  Schedule.create!(subject: subject, grade: grade, user: teacher, start_at: start_at)
}

# Create news

News.create!(
  title: 'Школа запустила электронную платформу',
  body: '...',
  user: user_10
)

News.create!(
  title: 'Соревнования в январе',
  body: 'В январе в школе пройдут соревнование на создание лучшего диплома.',
  user: user_10
)

News.create!(
  title: 'Поход в музей',
  body: 'Школа организует поход в "Военный музей" для 9-11 классов',
  user: user_10
)
