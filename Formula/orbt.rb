class Orbt < Formula
  desc "Universal terminal workspace — sessions, panes, and AI agents"
  homepage "https://github.com/linuszz/orbt"
  version "0.1.5"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-aarch64.tar.gz"
      sha256 "2e202945a99926efaa82cd046511474525552c003756823ba619bbed6a321c72"
    end
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-x86_64.tar.gz"
      sha256 "1cbf102ff6a3402cc1240cc81c44a1d84ccdae1c30ec4d2e98175d1acc290ea8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-linux-x86_64.tar.gz"
      sha256 "648dcbc2b990d0baabecfae3f1c170846e7c1df2384af5df803b97d1fdf2b0a8"
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
