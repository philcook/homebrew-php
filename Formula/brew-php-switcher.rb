class BrewPhpSwitcher < Formula
  desc "Switch Apache & CLI configs between PHP versions"
  homepage "https://github.com/philcook/php-switcher"
  url "https://github.com/philcook/brew-php-switcher/archive/1.6.tar.gz"
  sha256 "569b5ab5451bcfa784ff94141359fe4d80720c2fe4bf2d67f8fea33f5f05956e"
  head "https://github.com/philcook/brew-php-switcher.git"

  bottle do
    cellar :any_skip_relocation
    revision 2
    sha256 "2d6f3da2b210c0af0e25ca500463d2c9b27c253e5a10693a4929c7066111b9ed" => :el_capitan
    sha256 "aed56da5aadf84b3c2c850ca3d376db2f8ea17ee9d349c3f0a12218c47496765" => :yosemite
    sha256 "5437bb05157e988d9d7575fa2ae6217d135a5660c3417682f32c19c5d49631c7" => :mavericks
  end

  def install
    bin.install "phpswitch.sh"
    sh = libexec + "brew-php-switcher"
    sh.write("#!/usr/bin/env sh\n\nsh #{bin}/phpswitch.sh $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def caveats; <<-EOS.undent
    To run brew php switcher do the following:
      "brew-php-switcher 53".

    You can select php version 53, 54, 55, 56, 70 or 71.
    EOS
  end

  test do
    system "brew-php-switcher"
  end
end
