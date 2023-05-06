# :IronFocus to focus the repl
# <C-\><C-n> to exit it

:lf /home/goose/prj/nixpkgs/nixpkgs
pkgs = outputs.legacyPackages.x86_64-linux
:lf /etc/nixos

outputs.nixosConfigurations

metas = with builtins; lib.pipe pkgs [
  attrNames
  (map (n: tryEval pkgs.${n}))
  (filter (n: n.success))
  (map (n: n.value))
  (filter isAttrs)
  (filter (hasAttr "meta"))
  (map (d: d.meta))
  (filter isAttrs)
]

free_count = with builtins; lib.pipe metas [
  (filter (n: n.license.free))
  length
]

builtins.length metas
builtins.head metas

kok = (builtins.head metas)
kok.license


