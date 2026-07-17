class Orbit < Formula
  desc "Universal terminal workspace — sessions, panes, and AI agents"
  homepage "https://github.com/linuszz/orbit"
  version "0.1.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/linuszz/orbit/releases/download/v#{version}/orbit-macos-aarch64.tar.gz"
      sha256 "4b8ef4588ee794737d3d097175552cbd49513f4c6bd21d4c6d33b1816575de21"
    end
    on_intel do
      url "https://github.com/linuszz/orbit/releases/download/v#{version}/orbit-macos-x86_64.tar.gz"
      sha256 "1a4f18c81615f2970d19b9f19bde4ea5b1f429f52ca0a0c378861a2f3630b6ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/linuszz/orbit/releases/download/v#{version}/orbit-linux-x86_64.tar.gz"
      sha256 "7acbd65713837943fa9cd24ccc9048f7d4cdc1285588d3a5fe8ddac83791fc57"
    end
  end

  def install
    bin.install "orbit"
  end

  def post_install
    # Create config dir so first launch doesn't need to mkdir
    (var/"orbit").mkpath
  end

  service do
    run [opt_bin/"orbit", "daemon"]
    keep_alive true
    log_path var/"log/orbit.log"
    error_log_path var/"log/orbit.log"
  end

  test do
    assert_predicate bin/"orbit", :exist?
  end
end
