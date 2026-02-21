class NonoAlpha < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing (alpha)"
  homepage "https://github.com/always-further/nono"
  license "Apache-2.0"
  version "0.6.0-alpha.1"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.6.0-alpha.2/nono-v0.6.0-alpha.2-aarch64-apple-darwin.tar.gz"
      sha256 "2159b9d4c0bdaa9fefe8428ea5a2b8390ab16013a5330c571f3cb34e074bf940"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.6.0-alpha.2/nono-v0.6.0-alpha.2-x86_64-apple-darwin.tar.gz"
      sha256 "069328e6f959a81999a06fdb87e4a6ee3f10de9b9f543f46a9757d4dcbcb99e3"
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
        #{HOMEBREW_PREFIX}/opt/nono-alpha/bin/nono

      Or link it (replacing stable):
        brew link --force nono-alpha

      nono uses macOS Seatbelt for sandboxing.

      Quick start:
        nono run --allow . -- your-command
    EOS
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/nono --version")
  end
end
