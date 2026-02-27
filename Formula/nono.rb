class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.6.1/nono-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "50f5b26f4ee944a971b0dc07d94dc87f3c526d26769e0f1a82d9325ec30ada61"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.6.1/nono-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "158e3b328bfef8308ab596e89ba69e5978db5cf95c4a218aee8bbc264fd233a7"
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
