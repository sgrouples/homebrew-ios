class SwiftformatAT0610 < Formula
  desc "Formatting tool for reformatting Swift code"
  homepage "https://github.com/nicklockwood/SwiftFormat"
  url "https://github.com/nicklockwood/SwiftFormat/archive/refs/tags/0.61.0.tar.gz"
  sha256 "53523ffec0029bb9767a7fd899932ded99fa9c83ce46565d06a4a1f671460669"
  license "MIT"
  head "https://github.com/nicklockwood/SwiftFormat.git", branch: "develop"

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args, "--configuration", "release"
    bin.install ".build/release/swiftformat"
  end

  test do
    (testpath/"potato.swift").write <<~SWIFT
      struct Potato {
        let baked: Bool
      }
    SWIFT
    system bin/"swiftformat", testpath/"potato.swift"
  end
end
