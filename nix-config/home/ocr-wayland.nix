inputs@{ config, lib, pkgs, ... }: {
  xdg.desktopEntries = 
    let 
      ocr = lang: {
        name = "OCR image: ${lang}";
        exec = "${pkgs.writeScript "ocr" ''
          ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -w 0)" - | \
          ${pkgs.tesseract}/bin/tesseract -l ${lang} - - | \
          ${pkgs.wl-clipboard}/bin/wl-copy
        ''}";
      };
      ocr-trans = lang-src: lang-dst: {
        name = "OCR translate: ${lang-src} -> eng";
        exec = "${pkgs.writeScript "tr" ''
          ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -w 0)" - | \
          ${pkgs.tesseract}/bin/tesseract -l ${lang-src} - - | \
          tr '\n' ' ' |\
          ${pkgs.translate-shell}/bin/trans -t "${lang-dst}" -b | \
          ${pkgs.writeScript "stdin-to-yad" "
            text=
            while read line
            do
              text=\"$text $line\"
            done
            ${pkgs.yad}/bin/yad --text \"$text\" --no-buttons --escape-ok --text-align=center
          "}
        ''}";
      };
    in
  {
    ocr-en = ocr "eng";
    ocr-ru = ocr "rus";
    ocr-de = ocr "deu";
    ocr-all = ocr "eng+rus+deu";
    ocr-tr-deu = ocr-trans "deu" "en";
    ocr-tr-jpn = ocr-trans "jpn+eng" "en";
  };
}
