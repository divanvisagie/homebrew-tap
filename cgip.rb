class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.3.0/cgip-darwin-x86_64.tar.gz"
    sha256 "61fe112cb25c8e9afb16a8194df7c0237912c855c1050cc0d8c3a2a578fa5aae"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.3.0/cgip-darwin-aarch64.tar.gz"
    sha256 "064aba28eefc42851097967173199f3e2a55f2a5778c8372f9223800ce0d3e74"
  else
    odie "Your architecture is not supported!"
  end

  def install
    bin.install "cgip"
    man1.install "cgip.1"
  end

  test do
    system "#{bin}/cgip --version"
  end
end
