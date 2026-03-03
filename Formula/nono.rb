class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.8.1/nono-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "92cb5632588f3802143e3bb6cdb1ef2209723d73869e93f89bd9cd48d2306582"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.8.1/nono-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "8cb7cf4fb831597cdb33b2781572b9abf343f601a6f6de72b9fcae19afca9b53"
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
