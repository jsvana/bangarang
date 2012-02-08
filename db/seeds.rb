User.delete_all

User.create(name: 'Jay Vana', username: 'jsvana', password: 'linked', password_confirmation: 'linked', email: 'asdf@asdf.com', admin: true, approved: true)
User.create(name: 'Kaleb Elwert', username: 'kelwert', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com', approved: true)
User.create(name: 'Josh Lewis', username: 'jdlewis', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')
User.create(name: 'Steve Jobs', username: 'stjobs', password: 'asdf', password_confirmation: 'asdf', email: 'asdf@asdf.com')

Server.delete_all

hyperion = Server.create(hostname: 'hyperion', domain: 'jsvana.com', ip: '192.168.2.1/24')
artemis = Server.create(hostname: 'artemis', domain: 'jsvana.com', ip: '192.168.2.2/24')
apollo = Server.create(hostname: 'apollo', domain: 'jsvana.com', ip: '192.168.2.3/24')

Status.delete_all

hyperion.create_status(up: true, ports_open: 5, ports: '22,53,80,443,25565')
artemis.create_status(up: false, ports_open: 1, ports: '22')
apollo.create_status(up: true, ports_open: 3, ports: '22,80,9001')

servers = Server.all

servers.each do |server|
	puts "#{server.hostname}: #{server.status.up}"
end