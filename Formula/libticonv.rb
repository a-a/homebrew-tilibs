class Libticonv < Formula
  desc "Conversion lib for other Texas Instruments calculator libs"
  homepage "https://github.com/debrouxl/tilibs/tree/master/libticonv/trunk"
  url "http://datashed.science/misc/tilp2/1.17/libticonv-1.1.4.tar.bz2"
  version "0.1"
  sha256 "1faecc71311bd95c94792cc72dd0844e7881a65156b006f045bb417eddd45183"
  
  depends_on "autoconf"
  depends_on "automake"
  depends_on "pkg-config"
  depends_on "libtool"
  depends_on "glib"
  depends_on "gettext"
  
  def install
    cd "libticonv/" do
      system "autoreconf", "-i", "-v", "-f"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{prefix}"
      system "make", "install"
    end
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
