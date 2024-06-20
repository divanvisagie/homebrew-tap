class Nocol < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/nocol"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/nocol/releases/download/v0.0.2/nocol-darwin-x86_64.tar.gz"
    sha256 "79d0fd4e4af1941261f6bd894d678b8986a1bb53e990b39be6232ba6e7a90233"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/nocol/releases/download/v0.0.2/nocol-darwin-aarch64.tar.gz"
    sha256 "5f38e1f7d7c879cf3d32cdac96abe672b3fed6317f2945f0e2fd8fbeb3ad1e17"
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
