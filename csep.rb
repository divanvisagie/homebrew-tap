class Csep < Formula
  desc "CSV separator tool for terminal"
  homepage "https://github.com/divanvisagie/csep"

  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/csep/releases/download/v0.1.9/csep-darwin-x86_64.tar.gz"
    sha256 "a21784036f14d516d77cf084981e0c3aa7d2911b4c85d784e5295705f576007c"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/csep/releases/download/v0.1.9/csep-darwin-aarch64.tar.gz"
    sha256 "a4b295b93092bf2d1a0d0376faaa9f482f0a885dcf582c39f733dc395e7254d0"
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
