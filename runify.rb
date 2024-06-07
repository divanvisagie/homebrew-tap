class Runify < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/runify"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-x86_64.tar.gz"
    sha256 "e5095704edcce256e63420094cd31348fb7e9cfa909d0c5fdfbe871338b2ca28"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-aarch64.tar.gz"
    sha256 "dec15b295c4dfaa156458bab5b23d71d14ac412bb51dc1ce57b1b6833d4fc169"
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
