User.delete_all

User.create(name: 'Jay Vana', username: 'jsvana', password: 'linked', password_confirmation: 'linked', email: 'asdf@asdf.com', admin: true, approved: true)
User.create(name: 'Kaleb Elwert', username: 'kelwert', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com', approved: true)
User.create(name: 'Josh Lewis', username: 'jdlewis', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')
User.create(name: 'Steve Jobs', username: 'stjobs', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')

Server.delete_all

hyperion = Server.create(nickname: 'Firewall', hostname: 'hyperion', domain: 'jsvana.com', ip: '192.168.2.1/24')
artemis = Server.create(hostname: 'artemis', domain: 'jsvana.com', ip: '192.168.2.2/24')
apollo = Server.create(hostname: 'apollo', domain: 'jsvana.com', ip: '192.168.2.3/24')

Status.delete_all

hyperion.create_status(up: true, ports_open: 5, ports: '22,53,80,443,25565')
artemis.create_status(up: false, ports_open: 1, ports: '22')
apollo.create_status(up: true, ports_open: 3, ports: '22,80,9001')

Movie.delete_all

Movie.create(imdb_id: 'tt0499549', title: 'Avatar', year: 2009, description: 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', director: 'James Cameron', writer: 'James Cameron', runtime: 162, rating: '8.1', cover_url: 'http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1._SY317_CR0,0,214,317_.jpg', definition: '720p,1080p', hd: true)
Movie.create(imdb_id: 'tt0325980', title: 'Pirates of the Caribbean: The Curse of the Black Pearl', year: 2003, description: 'Blacksmith Will Turner teams up with eccentric pirate "Captain" Jack Sparrow to save his love, the governor\'s daughter, from Jack\'s former pirate allies, who are now undead.', director: 'Gore Verbinski', writer: 'Ted Elliot', runtime: 143, rating: '8.0', cover_url: 'http://ia.media-imdb.com/images/M/MV5BMjAyNDM4MTc2N15BMl5BanBnXkFtZTYwNDk0Mjc3._V1._SY317_CR0,0,214,317_.jpg', hd: false)
