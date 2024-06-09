class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.8/cgip-darwin-x86_64.tar.gz"
    sha256 "6ac21b9223f500673a824cbac7cbed0b84be17b55de081090e6761e400cfc614"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.8/cgip-darwin-aarch64.tar.gz"
    sha256 "bbde8128566f98fa99fe557f012334a985fe6148b37955827889bb15e3533332"
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
