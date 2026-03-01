class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.7.0/nono-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b8036f8685f9e7ca48903f7bef2eac3ba0d13dffa2e6bf623ba12d021238f7c"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.7.0/nono-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a06d36818b9527b888612941d123c2ec39092da07459cec6cde958fd3192a25"
    end
  end

  def install
    bin.install "nono"
  end

  def caveats
    <<~EOS
      nono uses macOS Seatbelt for sandboxing.

      Quick start:
        nono run --allow . -- your-command

      For more information:
        nono --help
        nono run --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nono --version")
  end
end
