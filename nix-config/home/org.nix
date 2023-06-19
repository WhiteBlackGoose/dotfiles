inputs@{ config, lib, pkgs, ... }: {
  xdg.desktopEntries = let
    todo = args: name: {
      name = name;
      exec = 
        let
          runNvim = ''
            sleep 0.5
            nvim --cmd 'lua vim.g["is_ide_mode"]=1' ${args} --cmd "let g:open_agenda=1" -o ~/me/_org/_main.org
          '';
        in
          ''${pkgs.writeScript "runTodo" ''
          cd ~/me/_org
          kitty ${pkgs.writeScript "runNvim" runNvim}
        ''}'';
      icon = pkgs.fetchurl { url="https://orgmode.org/resources/img/org-mode-unicorn.svg"; sha256="sha256-88a+wIN5Eh0xTwDKHuXTG7BA6zbBVaSGH0mO3B/sr0I="; };
    };
  in {
    todoDark = todo "" "TODO list";
    todoLight = todo "--cmd 'lua vim.g[\"startup_theme\"]=\"light\"'" "TODO list light";
  };
}
