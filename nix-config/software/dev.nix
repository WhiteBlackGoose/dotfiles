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
      scikit-learn
      notebook
      pkgs.neovim
      numpy
      pandas
      pytest
      geopandas
      pillow
      pynvim
      pyperclip
      scipy
      seaborn
      statsmodels
      tqdm
      yfinance
      # catboost
      debugpy
      torch
      keras
      opencv4
    ]))
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
