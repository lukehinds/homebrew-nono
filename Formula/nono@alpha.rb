class NonoATAlpha < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing (alpha)"
  homepage "https://github.com/always-further/nono"
  license "Apache-2.0"
  version "0.6.0-alpha.1"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.6.0-alpha.1/nono-v0.6.0-alpha.1-aarch64-apple-darwin.tar.gz"
      sha256 "9aed2eec0332caf55adc6939631d64c082d2a3e07d2166bbfa968b270dce0729"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.6.0-alpha.1/nono-v0.6.0-alpha.1-x86_64-apple-darwin.tar.gz"
      sha256 "0011036d18c9265e6d49d0c88cfa74180c2ebe853de32edb500f466ff8a37ece"
    end
  end

  # Allow installing alongside stable nono
  keg_only :versioned_formula

  def install
    bin.install "nono"
  end

  def caveats
    <<~EOS
      This is an ALPHA version of nono (v0.6.0-alpha.1).

      For the stable release, use:
        brew install always-further/nono/nono

      To use the alpha binary (since it's keg-only):
        #{HOMEBREW_PREFIX}/opt/nono@alpha/bin/nono

      Or link it (replacing stable):
        brew link --force nono@alpha

      nono uses macOS Seatbelt for sandboxing.

      Quick start:
        nono run --allow . -- your-command
    EOS
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/nono --version")
  end
end
