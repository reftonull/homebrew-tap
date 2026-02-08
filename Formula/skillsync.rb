class Skillsync < Formula
  desc "Sync skills and configuration across development tools"
  homepage "https://github.com/reftonull/skillsync"
  license "MIT"
  version "0.1.0"

  on_macos do
    url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-macos-universal.tar.gz"
    sha256 "9f4caef7af6edc54e7236cc2b6c320042213927fd59914d0678a5320721d12e1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-linux-aarch64.tar.gz"
      sha256 "54d2fe7dfc57a24cb49610c504459cc1d41615ba52c44da912647e04aeb16219"
    else
      url "https://github.com/reftonull/skillsync/releases/download/v#{version}/skillsync-linux-x86_64.tar.gz"
      sha256 "358d2f00e6066d5369548e6a2020f1561986e1a948d6e929dace3599b8a6b12f"
    end
  end

  def install
    bin.install "skillsync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillsync --version", 2)
  end
end
