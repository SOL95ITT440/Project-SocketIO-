module WEBSocket
  class Socket < Base::Socket
    extend Forwardable
    attr_reader :status

    def_delegators :@socket, :close, :closed?
    def_delegators :@socket, :addr, :peeraddr, :setsockopt

    def initialize rhost, rport, lhost = nil, lport = nil
      @status = :disconnected
      @socket = TCPSocket.new rhost, rport, lhost, lport
      connect rhost, rport
    end
  end
end
