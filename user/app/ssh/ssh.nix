{pkgs, ...}: {
  home.file.".ssh/config".text = ''

    Host *
        IdentityAgent ~/.1password/agent.sock

  '';
}
