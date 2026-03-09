class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.15.0/nono-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "4541f1253b0ff07cb8360f5cef7c4b9ba68dc28e7767fa38b1d5280dac7aaad2"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.15.0/nono-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "443a69f49f7066e509519e1cae1462bd30d68c5ae94b3d8f18db91d335de69df"
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
