class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.11.0/nono-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "67844a0c28e818491835566472d6be77784bcdeb1304e89cfe179c951fade8e3"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.11.0/nono-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "a5fa9c4451f85207a6a570eb9e96827aac3886c1aed3aac2205a060cd63ce666"
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
