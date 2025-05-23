require 'rclrb'

require 'std_msgs/msg'

$stdout.sync = true

class MinimalSubscriber < Rclrb::Node
  def initialize
    super("subscriber")
    self.create_subscription(StdMsgs::Msg::String, "topic", 1) { |msg| puts msg.data }
  end
end

def main(args)
  puts "start subscriber node"
  Rclrb.init(arguments: args)
  Rclrb.spin(MinimalSubscriber.new)
end

if $0 == __FILE__
  main(ARGV)
end
