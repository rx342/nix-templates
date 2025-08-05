{
  description = "rx342 templates";

  outputs =
    { ... }:
    {
      templates = {
        clang = {
          path = ./clang;
          description = "C++ using clang";
        };
        cpp = {
          path = ./cpp;
          description = "C++";
        };
        gpu = {
          path = ./gpu;
          description = "GPU with CUDA";
        };
        python = {
          path = ./python;
          description = "Python";
        };
      };
    };
}
