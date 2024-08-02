{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages (p: with p; [
      nltk
      openpyxl
      flake8
      jedi-language-server
      jupyter-client
      jupyter-console
      jupyterlab
      ipython
      notebook
      pkgs.neovim
      numpy
      pandas
      pytest
      pynvim
      pyperclip
      tqdm
      debugpy
      pyright
    ]))
    pyright
    git
    lazygit

    gcc
    gnumake
    clang
    clang-tools
    clangStdenv
    lua-language-server

    xxd
  ];
}
