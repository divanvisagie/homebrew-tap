class Nocol < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/nocol"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/nocol/releases/download/test-release/nocol-darwin-x86_64.tar.gz"
    sha256 "f851695451a73031b01ade8ac2bd6ac6b9646308fc0c5a97c4a3b3fb528fe515"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/nocol/releases/download/test-release/nocol-darwin-aarch64.tar.gz"
    sha256 "b4c3ab7f314bf73d84f011ba5d44fa0be3a390126cc52c74ccbe834d96de1bcb"
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
