{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Henning Dahlheim";
      user.email = "dev@dahlheim.ch";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_hackbook_ed25519.pub";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
    signing.format = "ssh";
    ignores = [
      ".DS_Store"
      "mise.local.toml"
      ".mise.local.toml"
      ".claude/*"
    ];
    includes = [
      {
        condition = "gitdir:~/Developer/gitlab.cyon.lan/";
        contents = {
          user.name = "Henning Dahlheim";
          user.email = "hd@cyon.ch";
        };
      }
      {
        condition = "gitdir:~/Developer/github.com/republik/";
        contents = {
          user.name = "Henning Dahlheim";
          user.email = "henning.dahlheim@republik.ch";
        };
      }
    ];
    lfs = { enable = true; };
  };
}
