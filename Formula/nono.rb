class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.6.0/nono-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "4f326fdf0311791d3de782c405d3af1d3938333301eea0bc454de9ebe2080ebb"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.6.0/nono-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "fd1737289424cc34958b56fd9deb7bb6ededdab5f1037e54a51bf878c7fdbb69"
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
