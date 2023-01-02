{ ... }:
{
  let
    my-python-packages = p: with p; [
      pandas
      neovim
    ];
  in
  environment.systemPackages = [
    python3.withPackages my-python-packages
  ];
}
