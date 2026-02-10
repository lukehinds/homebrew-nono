class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.3.1/nono-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "c67d4d4f4fc84bcd6971894773961e4db27ec2db9ecb4a971372fbe45b6d09f6"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.3.1/nono-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "d4b7ed1ce2f0e915927877551f099360293293106bc5b12707e3aecf62c7ff21"
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
