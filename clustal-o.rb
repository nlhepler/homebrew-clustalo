require 'formula'

class ClustalO < Formula
  homepage 'http://www.clustal.org/omega'
  url 'http://www.clustal.org/omega/clustal-omega-1.1.0.tar.gz'
  version '1.1.0'
  sha1 'b8c8ac500811c50a335c9dc2fcaf47a7245fa6a0'

  depends_on 'argtable'

  def install
    system "./configure", "OPENMP_CFLAGS='-fopenmp'", "CFLAGS='-DHAVE_OPENMP'",
                          "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test clustal-omega`.
    system "false"
  end
end
