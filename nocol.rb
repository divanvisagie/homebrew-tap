class Nocol < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/nocol"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/nocol/releases/download/test-release/nocol-darwin-x86_64.tar.gz"
    sha256 "b49503bb7a996b157038e972f1bee6d50e2412ccc4f6bbc1c2a5c60676b4d8f2"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/nocol/releases/download/test-release/nocol-darwin-aarch64.tar.gz"
    sha256 "1706e2ddd7829666b6377b775acc76b62a7ac5f942b15182eb7485dc40bc38a3"
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
