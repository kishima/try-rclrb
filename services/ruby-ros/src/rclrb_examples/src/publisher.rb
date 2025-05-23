require 'rclrb'

require 'std_msgs/msg'

class MinimalPublisher < Rclrb::Node
  def initialize()
    super("publisher_node")
    string_msg = StdMsgs::Msg::String.new
    string_msg.data = "Hello World!"
    pub = self.create_publisher(StdMsgs::Msg::String, "topic", 1)
    @timer = self.create_timer(1.0) do |time|
      pub.pub(string_msg)
    end
  end
end

def main(args)
  Rclrb.init(arguments: args)

  Rclrb.spin(MinimalPublisher.new)
end

if $0 == __FILE__
  main(ARGV)
end
