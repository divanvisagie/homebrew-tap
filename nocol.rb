class Nocol < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/nocol"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/nocol/releases/download/v0.0.1/nocol-darwin-x86_64.tar.gz"
    sha256 "48bd34564560eebc580e72e3c22f8b00f3baa2706269dbf71fc81a7ac051d720"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/nocol/releases/download/v0.0.1/nocol-darwin-aarch64.tar.gz"
    sha256 "ff34af98aff61660d7d3b234c2c33a965b9eba8e4a34f1a3201e3dde4c7a3734"
  else
    odie "Your architecture is not supported!"
  end

  def install
    bin.install "nocol"
    man1.install "nocol.1"
  end

  test do
    system "#{bin}/nocol --version"
  end
end
