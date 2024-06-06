class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/csep"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/csep/releases/download/v0.1.7/csep-darwin-x86_64.tar.gz"
    sha256 "0145bc0af8741cbb245e88f204bd184d827b73a6c9f3945bf919fee6ca9d4097"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/csep/releases/download/v0.1.7/csep-darwin-aarch64.tar.gz"
    sha256 "43cc2cbacf03370a9f71c39337342a450b1a2c4bb13541db71a8e1974d7a2e74"
  else
    odie "Your architecture is not supported!"
  end

  def install
    bin.install "csep"
    man1.install "csep.1"
  end

  test do
    system "#{bin}/csep --version"
  end
end
