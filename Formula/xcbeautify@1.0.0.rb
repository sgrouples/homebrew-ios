class XcbeautifyAT100 < Formula
  desc "Little beautifier tool for xcodebuild"
  homepage "https://github.com/tuist/xcbeautify"
  url "https://github.com/tuist/xcbeautify.git",
      tag:      "1.0.0",
      revision: "a996cc125e45afb9f2d77cacc5710f3595bcdd07"
  license "MIT"
  head "https://github.com/tuist/xcbeautify.git", branch: "master"

  # needs Swift tools version 5.7.0
  depends_on xcode: ["14.0", :build]

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/xcbeautify"
  end

  test do
    log = "CompileStoryboard /Users/admin/MyApp/MyApp/Main.storyboard (in target: MyApp)"
    assert_match "[\u{1B}[36mMyApp\u{1B}[0m] \u{1B}[1mCompiling\u{1B}[0m Main.storyboard",
      pipe_output("#{bin}/xcbeautify", log).chomp
    assert_match version.to_s,
      shell_output("#{bin}/xcbeautify --version").chomp
  end
end
