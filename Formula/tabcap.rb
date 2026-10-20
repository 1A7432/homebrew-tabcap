# typed: strict
# frozen_string_literal: true

# Homebrew formula for tabcap, generated: do not edit in the tap. The source is the template
# packaging/homebrew/tabcap.rb in https://github.com/1A7432/tabcap; scripts/homebrew-formula.ts
# fills the version and checksums from a release's SHA256SUMS, and .github/workflows/homebrew.yml
# pushes the result here for every published release (`brew install 1A7432/tabcap/tabcap`).
# Built targets: macOS arm64, Linux x64 and arm64 (no Intel macOS build).
class Tabcap < Formula
  desc "Browser for AI agents: background tabs, a11y-tree refs, recorded traffic"
  homepage "https://github.com/1A7432/tabcap"
  version "0.7.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/1A7432/tabcap/releases/download/v0.7.5/tabcap-v0.7.5-darwin-arm64.tar.gz"
      sha256 "2de2f59dea81bbc93147f1647669182301b159dc73f5dba563c2e5549966bf54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1A7432/tabcap/releases/download/v0.7.5/tabcap-v0.7.5-linux-x64.tar.gz"
      sha256 "54b0fddec5886b03b1ae2da6b313638fda1bae0eb7308b04e3eaf1c391f606e7"
    end
    on_arm do
      url "https://github.com/1A7432/tabcap/releases/download/v0.7.5/tabcap-v0.7.5-linux-arm64.tar.gz"
      sha256 "f6a1e65c4a66d7738f36de7c5177f8331858dc3c5c076c86939306a58a3e9a0a"
    end
  end

  def install
    bin.install "tabcap"
    (pkgshare/"skills").install "skills/tabcap"
    (pkgshare/"templates").install Dir["templates/*"]
    doc.install "README.md", "README.zh-CN.md"
  end

  def caveats
    <<~EOS
      Run `tabcap setup` once to download Chrome for Testing; `tabcap update` runs
      `brew upgrade tabcap` later.
      The agent skill is in #{opt_pkgshare}/skills/tabcap: copy it to
      ~/.claude/skills/tabcap (Claude Code) or your agent's skills directory.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tabcap --version")
  end
end
