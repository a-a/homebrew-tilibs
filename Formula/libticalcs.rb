class Libticalcs < Formula
  desc "Calculator lib for other Texas Instruments calculator libs"
  homepage "https://github.com/debrouxl/tilibs/tree/master/libticalcs/trunk"
  url "http://datashed.science/misc/tilp2/1.17/libticalcs2-1.1.8.tar.bz2"
  version "0.1"
  sha256 "a8286f8a2552bcad96beab99ce254e67b3dc1a03eb9d82f8de4bdf7b8efc3496"
  
  depends_on "autoconf"
  depends_on "automake"
  depends_on "pkg-config"
  depends_on "libtool"
  depends_on "glib"
  depends_on "libticables"
  depends_on "libticonv"
  depends_on "libtifiles"
  
  def install
    cd "libticalcs/" do
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
