class SwiftformatAT0524 < Formula
  desc "Formatting tool for reformatting Swift code"
  homepage "https://github.com/nicklockwood/SwiftFormat"
  url "https://github.com/nicklockwood/SwiftFormat/archive/0.52.4.tar.gz"
  sha256 "be48ed575724a25db1196ace465240397a2c1bc0724d1e452b3ae21ce706cae4"
  license "MIT"
  head "https://github.com/nicklockwood/SwiftFormat.git", branch: "master"

  depends_on xcode: ["10.1", :build]

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/swiftformat"
  end

  test do
    (testpath/"potato.swift").write <<~EOS
      struct Potato {
        let baked: Bool
      }
    EOS
    system "#{bin}/swiftformat", "#{testpath}/potato.swift"
  end
end
