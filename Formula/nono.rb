class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.8.0/nono-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "9b202718d1dd5ec5a70e67538da2e066de5a681bafd447665aac5fec1c803f17"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.8.0/nono-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "d195ac81207a3caa787ec423dcf8f2cbe76f96f8d4197138f5b964d34ef7b8a4"
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
