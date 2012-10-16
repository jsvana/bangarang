User.delete_all
Server.delete_all
Status.delete_all
Movie.delete_all
Artist.delete_all
Album.delete_all
Track.delete_all

# Users

User.create(name: 'Jay Vana', username: 'jsvana', password: 'linked', password_confirmation: 'linked', email: 'asdf@asdf.com', admin: true, approved: true)
User.create(name: 'Kaleb Elwert', username: 'kelwert', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com', approved: true)
User.create(name: 'Josh Lewis', username: 'jdlewis', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')
User.create(name: 'Steve Jobs', username: 'stjobs', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')

# Servers

hyperion = Server.create(nickname: 'Firewall', hostname: 'hyperion',
  domain: 'jsvana.com', ip: '192.168.2.1/24', port: 22)
artemis = Server.create(hostname: 'artemis', domain: 'jsvana.com',
  ip: '192.168.2.2/24', port: 22)

# Server Statuses

hyperion.create_status(up: false, ports_open: 0, ports: '')
artemis.create_status(up: false, ports_open: 0, ports: '')

# Movies

Movie.create(imdb_id: 'tt0499549', title: 'Avatar', year: 2009, description: 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', director: 'James Cameron', writer: 'James Cameron', runtime: 162, rating: '8.1', cover_url: 'http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1._SY317_CR0,0,214,317_.jpg', definition: '720p,1080p', hd: true)
Movie.create(imdb_id: 'tt0325980', title: 'Pirates of the Caribbean: The Curse of the Black Pearl', year: 2003, description: 'Blacksmith Will Turner teams up with eccentric pirate "Captain" Jack Sparrow to save his love, the governor\'s daughter, from Jack\'s former pirate allies, who are now undead.', director: 'Gore Verbinski', writer: 'Ted Elliot', runtime: 143, rating: '8.0', cover_url: 'http://ia.media-imdb.com/images/M/MV5BMjAyNDM4MTc2N15BMl5BanBnXkFtZTYwNDk0Mjc3._V1._SY317_CR0,0,214,317_.jpg', hd: false)

# Artists

coeur = Artist.create(name: 'Coeur de Pirate');
various = Artist.create(name: 'Various Artists');
big = Artist.create(name: 'BigGiantCircles')

# Albums

pirate = coeur.albums.create(name: 'Coeur de pirate', release_year: 2008, cover_url: 'http://ecx.images-amazon.com/images/I/61DvyGK1MVL._SS400_.jpg');
imposter_nostalgia = various.albums.create(name: 'Imposter Nostalgia', release_year: 2011, cover_url: 'http://ecx.images-amazon.com/images/I/61Elyr3RLNL._SS500_.jpg')

# Tracks

pirate.tracks.create(title: "Le long du large", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Comme des enfants", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Fondu au noir", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Corbeau", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Berceuse", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Intermission", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Printemps", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Ensemble", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "La vie est ailleurs", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Pour un infidele", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "Francis", track_number: 1, disk_number: 1)
pirate.tracks.create(title: "C'etait salement romantique", track_number: 1, disk_number: 1)

# Note: Only a few of these were given a test alternate artist_id... or rather one... or rather Alfred
imposter_nostalgia.tracks.create(title: "Chips Ahoy Mateys", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Super VVVVVVeat Boy", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Flicker", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "BGC418", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Fight the Current", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Katana Blaster", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Buzzsaw", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Happiness", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Yeah!", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Raindancer", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Fight the Current Flashy Mix", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Buzzsaw Just Can't Wait Mix", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Yo Ho Ye Big Giant Chips (Chips Ahoy Mateys)", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Katana Blaster Constantly Playing Mix", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Antimatter Factory", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "You Can Have Mine", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Your Quest is Over", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Big Giant Sea for a Dream (Bonus Track)", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Last Hope (Bonus Track)", track_number: 1, disk_number: 1)
imposter_nostalgia.tracks.create(title: "Some Things Are Not As They Seem (Impostor Nostalgia trailer) (Bonus Track)", track_number: 1, disk_number: 1)
