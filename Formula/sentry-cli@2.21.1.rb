class SentryCliAT2211 < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.21.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.21.1/sentry-cli-Darwin-universal"
    sha256 "b3fa785eb951a1baa19c5eadff88f62294249e34f57bc3ca619e6ed3fcc191d8"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.1/sentry-cli-Linux-aarch64"
        sha256 "14a0085f8008313a27b89332682d81a61621d7d368c76c93c46c5f01b34ee441"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.1/sentry-cli-Linux-armv7"
        sha256 "6363f60fbad5204abc7f70f7ca82c857c9b3c0ecde073fb5f89b23f3c808fcad"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.1/sentry-cli-Linux-x86_64"
        sha256 "dbdd719481867f55072c7769d04ad3f70dda648ef406b87f613722d09a0ec625"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.1/sentry-cli-Linux-i686"
        sha256 "f30d67893c9eb7b193658fb7cf2f066aa9c44af37d0c9ad4f2fd885b2abe5a1b"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
