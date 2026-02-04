class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/lukehinds/nono"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.6/nono-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "7532d621122672ea42377a2268ade068a22f1e6b751c47d03d514d03f707fdcd"
    end
    on_intel do
      url "https://github.com/lukehinds/nono/releases/download/v0.2.6/nono-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "0fb6654e48b8cc24a8116c13451166148212fbbc8541c987a66ba87782d6dc1a"
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
