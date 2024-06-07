class Runify < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/runify"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-x86_64.tar.gz"
    sha256 "24df9c2d963d82491a691e3b9537773c9a0f4213f8978358057ce68159a24449"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-aarch64.tar.gz"
    sha256 "24df9c2d963d82491a691e3b9537773c9a0f4213f8978358057ce68159a24449"
  else
    odie "Your architecture is not supported!"
  end

  def install
    bin.install "runify"
    man1.install "runify.1"
  end

  test do
    system "#{bin}/runify --version"
  end
end
