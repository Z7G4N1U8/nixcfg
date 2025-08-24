{
  services.kanata = {
    enable = true;
    keyboards.default = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          spc caps
        )

        (defvar
          tap-time 150
          hold-time 200
        )

        (defalias
          spc (tap-hold $tap-time $hold-time spc lmet)
          caps (tap-hold $tap-time $hold-time esc caps)
        )

        (deflayer base
          @spc @caps
        )
      '';
    };
  };
}
