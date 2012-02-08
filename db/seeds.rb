User.delete_all

User.create(name: 'Jay Vana', username: 'jsvana', password: 'linked', password_confirmation: 'linked', email: 'asdf@asdf.com', admin: true, approved: true)
User.create(name: 'Kaleb Elwert', username: 'kelwert', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com', approved: true)
User.create(name: 'Josh Lewis', username: 'jdlewis', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')
User.create(name: 'Steve Jobs', username: 'stjobs', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')
