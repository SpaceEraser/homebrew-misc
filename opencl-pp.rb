class OpenclPp < Formula
  desc "Official OpenCL C++ wrapper by the Khronos Group"
  homepage "https://www.khronos.org/registry/cl/"
  url "https://www.khronos.org/registry/cl/api/2.1/cl.hpp"
  version "1.2"
  sha256 "08034743b513512bb6ea3a1e9a59bdf1842d8199fccad73ac1b406a88d60f7e0"

  devel do
    url "https://www.khronos.org/registry/cl/api/2.1/cl2.hpp"
    version "2.1"
    sha256 "c193fe3f3c7196f9e017561da2bb0aebb3a8373571f5d789ea173525a44da8a8"
  end

  bottle :unneeded

  def install
    filename = build.stable? ? "./cl.hpp" : "./cl2.hpp"

    mkdir "OpenCL"
    mkdir "CL"
    cp filename, "./OpenCL/"
    cp filename, "./CL/"
    rm filename

    include.install Dir["./*"]
  end
end
