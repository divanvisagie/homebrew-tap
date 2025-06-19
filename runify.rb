class Runify < Formula
  desc "Tool to run and manage scripts"
  homepage "https://github.com/divanvisagie/runify"

  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/runify/releases/download/v0.1.0/runify-darwin-x86_64.tar.gz"
    sha256 "59d6c312d08d6b4eb82e2ebc2a83065ce6138a58f897d8a2780b843db720851e"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/runify/releases/download/v0.1.0/runify-darwin-aarch64.tar.gz"
    sha256 "59d6c312d08d6b4eb82e2ebc2a83065ce6138a58f897d8a2780b843db720851e"
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
