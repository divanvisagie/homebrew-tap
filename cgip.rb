class Cgip < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  
  # Dynamically set the URL and SHA256 based on the CPU architecture
  if Hardware::CPU.intel?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.9/cgip-darwin-x86_64.tar.gz"
    sha256 "9c319de122e281355a73651785ab1f4409a66154944b0451470e4880eb4e8119"
  elsif Hardware::CPU.arm?
    url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.2.9/cgip-darwin-aarch64.tar.gz"
    sha256 "bd49e108bc0e41b50f614db74d4c54cf1f33c188ab51ca2af730ef5d1a033f9a"
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
