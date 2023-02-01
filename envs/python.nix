with import <nixpkgs> {};
mkShell {
  nativeBuildInputs = [
    (python3.withPackages (p: with p; [
      flake8
      jedi-language-server
      jupyter-client
      jupyter_console
      neovim
      numpy
      pandas
      pillow
      pygmentex
      pynvim
      pyperclip
      scipy
      seaborn
      statsmodels
      tqdm
    ]))
    ueberzug
  ];
}
