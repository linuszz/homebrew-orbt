class Orbt < Formula
  desc "Universal terminal workspace — sessions, panes, and AI agents"
  homepage "https://github.com/linuszz/orbt"
  version "0.1.7"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-aarch64.tar.gz"
      sha256 "940437e17105789e61eee0e620cf385b1af1f6d9a2a5f570f655f37e402b77ff"
    end
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-x86_64.tar.gz"
      sha256 "ecd3d90d0ef0d4c267d62e197a9b10aaf6bf82a525041c29ba74b871f9e7f626"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-linux-x86_64.tar.gz"
      sha256 "dd3fe03a709cf2a3d94f67e045295af90171ecc7c2b3057fa75bcbba7d1ab7a9"
    end
  end

  def install
    bin.install "orbt"
  end

  def post_install
    (var/"orbt").mkpath
  end

  service do
    run [opt_bin/"orbt", "daemon"]
    keep_alive true
    log_path var/"log/orbt.log"
    error_log_path var/"log/orbt.log"
  end

  test do
    assert_predicate bin/"orbt", :exist?
  end
end
