class Nocol < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/nocol"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/nocol/releases/download/test-release/nocol-darwin-x86_64.tar.gz"
    sha256 "0794a96ab8b943b6b16eb73ac14a1d3765e9a762fd0f812e9bd4cd799cfc0bd7"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/nocol/releases/download/test-release/nocol-darwin-aarch64.tar.gz"
    sha256 "fe469ea3776b9a824e8b9bbac3e7da15ec688c4cf5307840e09d9e30bcfc360d"
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
