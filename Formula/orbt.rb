class Orbt < Formula
  desc "Universal terminal workspace — sessions, panes, and AI agents"
  homepage "https://github.com/linuszz/orbt"
  version "0.1.6"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-aarch64.tar.gz"
      sha256 "bb2281a120800f35c60aa29091876f2878234f3eb4bd35f9e36150dda62a6bd4"
    end
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-x86_64.tar.gz"
      sha256 "bc235e9560c77d0a8bb8d8cb0175fa4d0b1042c2afa21e47f9d78deefead1552"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-linux-x86_64.tar.gz"
      sha256 "fde5ead649b18774a45f570bfbdc851bc641453f9d21a7850893873f0c786e20"
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
