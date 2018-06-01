require 'bunny'

config = {
  host: '152.118.148.103',
  port: '5672',
  vhost: '/1406573822',
  user: '1406573822',
  password: '1406573822'
}
connection = Bunny.new(config)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
