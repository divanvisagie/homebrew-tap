class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.10/cgip-darwin-x86_64.tar.gz"
    sha256 "00d2f34aa7a65fce5eb4af206fc01e5a7fa6ed64d142c5878ba9368f405dc5a5"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.10/cgip-darwin-aarch64.tar.gz"
    sha256 "b2b94a908196eeb8efc0861f271c5ffc81e269983dcc4e9a6fe65b009de2f035"
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
