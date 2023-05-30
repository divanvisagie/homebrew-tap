
class YourProgram < Formula
  desc "Terminal client for Chat GPT"
  homepage "https://github.com/divanvisagie/chat-gipity"
  url "https://github.com/divanvisagie/chat-gipity/releases/download/v0.1.2/cgip"
  sha256 "5fcb9b250efb7d32bae15e1b6b252d4f261beffd1ff344c428cf761a441500f5"

  def install
    bin.install "cgip"
  end

  test do
    system "#{bin}/cgip --version"
  end
end
