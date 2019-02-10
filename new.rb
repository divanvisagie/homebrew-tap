# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class New < Formula
  desc "new is a command to create projects off of github seed repos"
  homepage "https://github.com/divanvisagie/new"
  url "https://github.com/divanvisagie/new/releases/download/v0.0.9/new_0.0.9_darwin_amd64.tar.gz"
  sha256 "99701990db3d241aea9417a01173fce44e465064fee3665690c3fbbbeb4481e0"

  def install
     bin.install "new"
  end
end
