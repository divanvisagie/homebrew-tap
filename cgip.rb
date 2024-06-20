class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.11/cgip-darwin-x86_64.tar.gz"
    sha256 "f9c57fc76fa77deda6ecad3681346f0aa4a7c78de9b822299753d27ada78a20f"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.11/cgip-darwin-aarch64.tar.gz"
    sha256 "bbc856703a1c611a8a836da967e5a25b5d06b5cde5b971cb5c503cecc109a42d"
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
