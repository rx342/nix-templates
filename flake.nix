{
  description = "rx342 templates";

  outputs =
    { ... }:
    {
      templates = {
        clang = {
          path = ./clang;
          description = "Template for C++ using clang";
        };
        cpp = {
          path = ./cpp;
          description = "Template for C++";
        };
        gpu = {
          path = ./gpu;
          description = "Template to use GPU with CUDA";
        };
        python = {
          path = ./python;
          description = "Template for Python";
        };
      };
    };
}
