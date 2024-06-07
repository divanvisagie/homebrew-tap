class Runify < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/runify"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-x86_64.tar.gz"
    sha256 "5d8bdeb630cf03902360f4fd85eeb302e4e74413a4e00e975bab88cedd49ba78"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/runify/releases/download/test-release/runify-darwin-aarch64.tar.gz"
    sha256 "f1172f6c3bc104be5f238cbc374d8b67c17b0aac0ceb35b6f47f165af5b7d6d6"
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
