class Runify < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/runify"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-x86_64.tar.gz"
    sha256 "78b83d7d6198e602ac53639d8548513e96607b9cb00febcc2ae38161efc8c886"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-aarch64.tar.gz"
    sha256 "caa4bd1d774c73d9138ac938049dc134f88a84269f9d29f07e063251c27c2295"
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
