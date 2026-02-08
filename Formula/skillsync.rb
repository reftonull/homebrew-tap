class Skillsync < Formula
  desc "Sync skills and configuration across development tools"
  homepage "https://github.com/reftonull/skillsync"
  license "MIT"
  version "0.1.0"

  on_macos do
    url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-macos-universal.tar.gz"
    sha256 "32f3bafc03c9cebf32f628d5aac765e6b3aa6e71ac824a6f0ca02e6c377199c6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-linux-aarch64.tar.gz"
      sha256 "f6c48242acde20ee4349b10d9de80c875e60027aa092de1d9f522afd82249a1a"
    else
      url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-linux-x86_64.tar.gz"
      sha256 "42c746a695cbef474c3ff12447d64740e52e38abf9c882ec2340a0e7078a86d8"
    end
  end

  def install
    bin.install "skillsync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillsync --version", 2)
  end
end
