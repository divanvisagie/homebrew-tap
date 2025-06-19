class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"

  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.5.0/cgip-darwin-x86_64.tar.gz"
    sha256 "f73a21e71c62e5692bc521d78edf2d119358d91ef33359cf01213c520926505b"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.5.0/cgip-darwin-aarch64.tar.gz"
    sha256 "236100300614af2e73c1f6fee8711d8de1c6955b7902f088017912546f46ea5e"
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
