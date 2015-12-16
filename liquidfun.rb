class Liquidfun < Formula
  desc "LiquidFun is a 2D rigid-body and fluid simulation C++ library for games based upon Box2D."
  homepage "http://google.github.io/liquidfun/"
  url "https://github.com/google/liquidfun/releases/download/v1.1.0/liquidfun-1.1.0.tar.gz"
  version "1.1.0"
  sha256 "5011a000eacd6202a47317c489e44aa753a833fb562d970e7b8c0da9de01df86"
  head "https://github.com/google/liquidfun.git"

  depends_on "cmake" => :build
  depends_on :x11 if build.with? "examples"

  option "with-examples", "Build examples; requires XQuartz"
  option "with-shared", "Build with shared libraries"
  option "with-docs", "Build and install documentation"
  option "without-unit-tests", "Build without unit tests."

  conflicts_with "box2d",
    :because => "Liquidfun expands on Box2D, which will cause header/doc collisions"

  patch :DATA

  def install
    args = std_cmake_args
    args << "-DCMAKE_BUILD_TYPE=Release"
    args << "-DBOX2D_INSTALL=ON"
    args << "-DBOX2D_BUILD_UNITTESTS=OFF" if build.without? "unit-tests"
    args << "-DBOX2D_INSTALL_DOC=ON" if build.with? "docs"
    args << "-DBOX2D_BUILD_EXAMPLES=OFF" if build.without? "examples"
    args << "-DBOX2D_BUILD_SHARED=ON" if build.with? "shared"

    cd "liquidfun/Box2D" do
      system "cmake", "-G", "Unix Makefiles", *args

      system "make"

      system "make", "install"
    end
  end

  # test do
  # end
end

__END__
diff --git a/liquidfun/Box2D/CMakeLists.txt b/liquidfun/Box2D/CMakeLists.txt
index 83d1639..185ae05 100644
--- a/liquidfun/Box2D/CMakeLists.txt
+++ b/liquidfun/Box2D/CMakeLists.txt
@@ -2,6 +2,8 @@ cmake_minimum_required(VERSION 2.8)
 
 project(Box2D)
 
+find_package (Threads)
+
 if(UNIX)
   set(BOX2D_INSTALL_BY_DEFAULT ON)
 else(UNIX)
