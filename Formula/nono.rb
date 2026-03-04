class Nono < Formula
  desc "Capability-based shell for AI agents with OS-enforced sandboxing"
  homepage "https://github.com/always-further/nono"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/always-further/nono/releases/download/v0.10.0/nono-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "27f052fde0f0449eb00873083d4c805df736979b6c1d97740be3701a3fe7571a"
    end
    on_intel do
      url "https://github.com/always-further/nono/releases/download/v0.10.0/nono-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "4f1fd271566619630838a0d9f34fc55b26a13feaded64584cd35a99be5fe81ea"
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
