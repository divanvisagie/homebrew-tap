class Nocol < Formula
  desc "Tool to remove color codes from terminal output"
  homepage "https://github.com/divanvisagie/nocol"

  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/nocol/releases/download/v0.0.3/nocol-darwin-x86_64.tar.gz"
    sha256 "923019f908809b7b55071ee39246eff947b777ac07ef3f131300b142daecec70"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/nocol/releases/download/v0.0.3/nocol-darwin-aarch64.tar.gz"
    sha256 "923019f908809b7b55071ee39246eff947b777ac07ef3f131300b142daecec70"
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
