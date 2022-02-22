# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `net-smtp` gem.
# Please instead update this file by running `bin/tapioca gem net-smtp`.

class Net::SMTP < ::Net::Protocol
  def initialize(address, port = T.unsafe(nil), tls: T.unsafe(nil), starttls: T.unsafe(nil), tls_verify: T.unsafe(nil), tls_hostname: T.unsafe(nil), ssl_context_params: T.unsafe(nil)); end

  def address; end
  def auth_cram_md5(user, secret); end
  def auth_login(user, secret); end
  def auth_plain(user, secret); end
  def authenticate(user, secret, authtype = T.unsafe(nil)); end
  def capabilities; end
  def capable?(key); end
  def capable_auth_types; end
  def capable_cram_md5_auth?; end
  def capable_login_auth?; end
  def capable_plain_auth?; end
  def capable_starttls?; end
  def data(msgstr = T.unsafe(nil), &block); end
  def debug_output=(arg); end
  def disable_ssl; end
  def disable_starttls; end
  def disable_tls; end
  def ehlo(domain); end
  def enable_ssl(context = T.unsafe(nil)); end
  def enable_starttls(context = T.unsafe(nil)); end
  def enable_starttls_auto(context = T.unsafe(nil)); end
  def enable_tls(context = T.unsafe(nil)); end
  def esmtp; end
  def esmtp=(_arg0); end
  def esmtp?; end
  def finish; end
  def helo(domain); end
  def inspect; end
  def mailfrom(from_addr); end
  def open_message_stream(from_addr, *to_addrs, &block); end
  def open_timeout; end
  def open_timeout=(_arg0); end
  def port; end
  def quit; end
  def rcptto(to_addr); end
  def rcptto_list(to_addrs); end
  def read_timeout; end
  def read_timeout=(sec); end
  def ready(from_addr, *to_addrs, &block); end
  def rset; end
  def send_mail(msgstr, from_addr, *to_addrs); end
  def send_message(msgstr, from_addr, *to_addrs); end
  def sendmail(msgstr, from_addr, *to_addrs); end
  def set_debug_output(arg); end
  def ssl?; end
  def ssl_context_params; end
  def ssl_context_params=(_arg0); end
  def start(*args, helo: T.unsafe(nil), user: T.unsafe(nil), secret: T.unsafe(nil), password: T.unsafe(nil), authtype: T.unsafe(nil)); end
  def started?; end
  def starttls; end
  def starttls?; end
  def starttls_always?; end
  def starttls_auto?; end
  def tls?; end
  def tls_hostname; end
  def tls_hostname=(_arg0); end
  def tls_verify; end
  def tls_verify=(_arg0); end

  private

  def auth_capable?(type); end
  def auth_method(type); end
  def base64_encode(str); end
  def check_auth_args(user, secret, authtype = T.unsafe(nil)); end
  def check_auth_continue(res); end
  def check_auth_method(type); end
  def check_auth_response(res); end
  def check_continue(res); end
  def check_response(res); end
  def cram_md5_response(secret, challenge); end
  def cram_secret(secret, mask); end
  def critical; end
  def do_finish; end
  def do_helo(helo_domain); end
  def do_start(helo_domain, user, secret, authtype); end
  def get_response(reqline); end
  def getok(reqline); end
  def logging(msg); end
  def new_internet_message_io(s); end
  def recv_response; end
  def ssl_socket(socket, context); end
  def tcp_socket(address, port); end
  def tlsconnect(s, context); end
  def validate_line(line); end

  class << self
    def default_port; end
    def default_ssl_context(ssl_context_params = T.unsafe(nil)); end
    def default_ssl_port; end
    def default_submission_port; end
    def default_tls_port; end
    def start(address, port = T.unsafe(nil), *args, helo: T.unsafe(nil), user: T.unsafe(nil), secret: T.unsafe(nil), password: T.unsafe(nil), authtype: T.unsafe(nil), tls: T.unsafe(nil), starttls: T.unsafe(nil), tls_verify: T.unsafe(nil), tls_hostname: T.unsafe(nil), ssl_context_params: T.unsafe(nil), &block); end
  end
end

class Net::SMTP::Address
  def initialize(address, *args, **kw_args); end

  def address; end
  def parameters; end
  def to_s; end
end

class Net::SMTP::Response
  def initialize(status, string); end

  def capabilities; end
  def continue?; end
  def cram_md5_challenge; end
  def exception_class; end
  def message; end
  def status; end
  def status_type_char; end
  def string; end
  def success?; end

  class << self
    def parse(str); end
  end
end

Net::SMTP::VERSION = T.let(T.unsafe(nil), String)

module Net::SMTPError
  def initialize(response, message: T.unsafe(nil)); end

  def message; end
  def response; end
end

Net::SMTPSession = Net::SMTP