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

Artist.delete_all
#yelle = Artist.create(name: 'Yelle')
coeur = Artist.create(name: 'Coeur de Pirate');
various = Artist.create(name: 'Various Artists');

Album.delete_all
#safari = Album.create(name: 'Safari Disco Club', artist_id: yelle.id, release_year: 2011);
#pop = Album.create(name: 'Pop Up', artist_id: yelle.id, release_year: 2007);
coeur_album = Album.create(name: 'Coeur de pirate', artist_id: coeur.id, release_year: 2008);
#blonde = Album.create(name: 'Blonde', artist_id: coeur_id, release_year: 2011);
imposter = Album.create(name: 'Imposter Nostalgia', artist_id: various.id, release_year: 2011)

Track.delete_all
Track.create(title: "Le long du large", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Comme des enfants", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Fondu au noir", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Corbeau", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Berceuse", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Intermission", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Printemps", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Ensemble", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "La vie est ailleurs", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Pour un infid?le", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "Francis", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)
Track.create(title: "C'etait salement romantique", artist_id: coeur.id, album_id: coeur_album, track_number: 1, disk_number: 1)

Track.create(title: "Chips Ahoy Mateys", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Super VVVVVVeat Boy", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Flicker", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "BGC418", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Fight the Current", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Katana Blaster", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Buzzsaw", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Happiness", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Yeah!", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Raindancer", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Fight the Current Flashy Mix", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Buzzsaw Just Can't Wait Mix", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Yo Ho Ye Big Giant Chips (Chips Ahoy Mateys)", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Katana Blaster Constantly Playing Mix", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Antimatter Factory", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "You Can Have Mine", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Your Quest is Over", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Big Giant Sea for a Dream (Bonus Track)", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Last Hope (Bonus Track)", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
Track.create(title: "Some Things Are Not As They Seem (Impostor Nostalgia trailer) (Bonus Track)", artist_id: various.id, album_id: imposter.id, track_number: 1, disk_number: 1)
