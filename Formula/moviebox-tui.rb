class MovieboxTui < Formula
  VERSION = "0.1.28"
  MACOS_SHA256 = "95ca2be323c5105a22344037b190a46c017f34db1f6a2c1d440a29ce9a6814ad"
  LINUX_X64_SHA256 = "b18fdef98904c7aa08d978402e048ca4b016075b9ce8b7b449ba1e15a9a9af5d"
  LINUX_ARM64_SHA256 = "c8fe712ca87c0b4116d2876ace3f225565d5c70659f7ae4015c3eb23e8372f3b"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
