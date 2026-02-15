class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.5.0/nono-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "5269ab5357c21d36cee70c3c6a499cd2538d34de03229f2c9c0f4915568e9d88"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.5.0/nono-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "20345a92a8c6ab7c998c102f4a621a8945c27e1b91908dcc186cb7a624f8b8cd"
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
