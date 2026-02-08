class Skillsync < Formula
  desc "Sync skills and configuration across development tools"
  homepage "https://github.com/reftonull/skillsync"
  license "MIT"
  version "0.1.1"

  on_macos do
    url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-macos-universal.tar.gz"
    sha256 "ac3450e1027d5d1318f6cd2e76d8f13d4831694520fd14077fa1e4fe92a7a600"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-linux-aarch64.tar.gz"
      sha256 "1eb1c44188b24365f23d17ba1e89ba09a88da938e34548593144d93934c151aa"
    else
      url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-linux-x86_64.tar.gz"
      sha256 "35a751c9566c124f1cbcfb6ad1c9ae1593a1a96b40ca85f9dd4cfd4b5033c8f1"
    end
  end

  def install
    bin.install "skillsync"
    generate_completions_from_executable(bin/"skillsync", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillsync --version", 2)
  end
end
