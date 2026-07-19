class Orbt < Formula
  desc "Universal terminal workspace — sessions, panes, and AI agents"
  homepage "https://github.com/linuszz/orbt"
  version "0.1.10"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-aarch64.tar.gz"
      sha256 "502bd27ad2e534a327be44ceea9b6e0d2632312bd0bec9f64c25fda5efc47853"
    end
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-macos-x86_64.tar.gz"
      sha256 "7cb7c2b70da6fcafcdf93fd887a950b3f32dc0da4e5b83ac8e5afb405fc2a444"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/linuszz/orbt/releases/download/v#{version}/orbt-linux-x86_64.tar.gz"
      sha256 "9a99eed338332050a78660156b105271353c724832af2a1a8ec65e97aea8390d"
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
