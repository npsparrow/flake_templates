{
  description = "sparrow flake templates";

  outputs = {self, ...}: {
    templates = {

      python-shell = {
        path = ./python-shell;
        description = "Basic python shell.";
      };

      cpp-shell = {
        path = ./cpp-shell;
        description = "Basic c++ (gcc) shell.";
      };

    };
  };

}
