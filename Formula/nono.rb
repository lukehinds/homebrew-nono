class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.14.0/nono-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "89c870662a6a512ae32bf7c925a977a1d30dd14d16fd010af7fc22229470e361"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.14.0/nono-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "1eab127935a120c036f36c03c8472ebe51a5039cbf113fdfd7d42ebcc48c270b"
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
