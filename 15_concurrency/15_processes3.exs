defmodule Parent do
  def send_message(pid) do
    send pid, "Hello, I'm your father"
    exit(:failure)
  end
end

defmodule Child do
  def receive_message do
    receive do
      msg -> IO.inspect msg
             receive_message()
    end
  end
end


spawn_link(Parent, :send_message, [self()])
:timer.sleep(500)
Child.receive_message
