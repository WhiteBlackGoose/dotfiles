inputs@{ config, lib, pkgs, ... }: {
  options = {
    ocr = lib.mkOption { 
      default = null;
    };
  };
  config.xdg.desktopEntries = if config.ocr != null then
  {
    ocr-en = config.ocr.to-clipboard "eng";
    ocr-ru = config.ocr.to-clipboard "rus";
    ocr-de = config.ocr.to-clipboard "deu";
    ocr-all = config.ocr.to-clipboard "eng+rus+deu";
    ocr-tr-deu = config.ocr.translate "deu" "en";
    ocr-tr-jpn = config.ocr.translate "jpn+eng" "en";
  } else {};
}
