inputs@{ config, lib, pkgs, ... }: {
  xdg.desktopEntries = 
    let 
      ocr = lang: {
        name = "OCR image: ${lang}";
        exec = "${pkgs.writeScript "ocr" ''
          ${pkgs.xfce.xfce4-screenshooter}/bin/xfce4-screenshooter -r --save /dev/stdout | \
          ${pkgs.tesseract}/bin/tesseract -l ${lang} - - | \
          ${pkgs.xclip}/bin/xclip -sel clip
        ''}";
      };
      ocr-trans = lang-src: lang-dst: {
        name = "OCR translate: all -> eng";
        exec = "${pkgs.writeScript "tr" ''
          ${pkgs.xfce.xfce4-screenshooter}/bin/xfce4-screenshooter -r --save /dev/stdout | \
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
    ocr-tr = ocr-trans "deu" "en";
  };
}
