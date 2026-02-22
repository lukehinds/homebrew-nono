class NonoAlpha < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing (alpha)"
  homepage "https://github.com/always-further/nono"
  license "Apache-2.0"
  version "0.6.0-alpha.1"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.6.0-alpha.3/nono-v0.6.0-alpha.3-aarch64-apple-darwin.tar.gz"
      sha256 "62e5c19a9e9ca73e988871d16d47285f0fbdd71b781f9fde7285f25c5e2a7fe1"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.6.0-alpha.3/nono-v0.6.0-alpha.3-x86_64-apple-darwin.tar.gz"
      sha256 "65ec7ca942f298cd4b1e5940098d35937dcad9c353fccbe94cb2d12a53a92e51"
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
