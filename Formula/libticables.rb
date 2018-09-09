class Libticables < Formula
  desc "Cables library for connecting to Texas Instruments calculators"
  homepage "https://github.com/debrouxl/tilibs/tree/master/libticables/trunk"
  url "http://datashed.science/misc/tilp2/1.17/libticables2-1.3.4.tar.bz2"
  version "0.1"
  sha256 "45cae91ad9ee1cc2ebc0f5865923ff77f1e0adf0793d3010eeb802efc140e5b0"
  
  depends_on "autoconf"
  depends_on "automake"
  depends_on "pkg-config"
  depends_on "libtool"
  depends_on "glib"
  depends_on "libusb"
  depends_on "gtk"
  depends_on "libglade"
  depends_on "gettext"
  depends_on "bison"
  depends_on "flex"
  depends_on "texinfo"
  depends_on "libarchive"
  depends_on "intltool"
  
  def install
    system "autoreconf", "-i", "-v", "-f"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-libusb10"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libticables`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
