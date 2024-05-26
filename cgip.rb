class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.5/cgip-darwin-x86_64.tar.gz"
    sha256 "b2c7a676a13ec460ea72e47cd2b34c2858fe662012a479569916a11081366cba"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.6/cgip-darwin-arm64.tar.gz"
    sha256 "c30564aca93d1a9f78ba34f823a8afd215c4f626ca045f5ac42214d2f80d787a"
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
