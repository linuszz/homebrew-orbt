class Orbt < Formula
  desc "Universal terminal workspace — sessions, panes, and AI agents"
  homepage "https://github.com/linuszz/orbt"
  version "0.1.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-aarch64.tar.gz"
      sha256 "430474f0b721f72b98740d5695b6bda509e12474ef249a6ff4f5cfca115a03b6"
    end
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-x86_64.tar.gz"
      sha256 "f4643b9df8b28555d286c6ae56409c15e2b8212700fc152cdf38f90baea3583a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-linux-x86_64.tar.gz"
      sha256 "bf8f7d01403bf23c3108795987de09e6e2829599752aba4ba6fc18021151d795"
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
