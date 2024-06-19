class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.9/cgip-darwin-x86_64.tar.gz"
    sha256 "b9daf109068207cae342b0841f1e24362edc1cff5ddaf2ae5620601cd638413e"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.9/cgip-darwin-aarch64.tar.gz"
    sha256 "a449aacaddd247020896a6f103cf0038bb85dd3050ceb4357cd79706f4580e86"
  else
    odie "Your architecture is not supported!"
  end

  def install
    bin.install "cgip"
    man1.install "cgip.1"
  end

  test do
    system "#{bin}/cgip --version"
  end
end
