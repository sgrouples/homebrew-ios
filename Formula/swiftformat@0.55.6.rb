class SwiftformatAT0556 < Formula
  desc "Formatting tool for reformatting Swift code"
  homepage "https://github.com/nicklockwood/SwiftFormat"
  url "https://github.com/nicklockwood/SwiftFormat/archive/refs/tags/0.55.6.tar.gz"
  sha256 "3914c84ccd1e03a7dd3a518f90b1987c4b7c5dcb7f81b86aad23a3fed53a7b0f"
  license "MIT"
  head "https://github.com/nicklockwood/SwiftFormat.git", branch: "master"

  depends_on xcode: ["10.1", :build]

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
    system bin/"swiftformat", "#{testpath}/potato.swift"
  end
end
