{
  security.pam.services.quickshell = {
      text = ''
          auth sufficient pam_fprintd.so
          auth required pam_unix.so
      '';
  };
}