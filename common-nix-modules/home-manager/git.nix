{ ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "S.Percentage";
      user.email = "Syn.Tri.Naga@gmail.com";
      # user.email = "2141528+Pctg-x8@users.noreply.github.com"; # using private email

      alias = {
        a = "add -p";
        aa = "add";
        cm = "commit -m";
        st = "status -sb";
        co = "checkout";
        p = "push";
        pu = "push -u";
        pff = "pull --ff-only";
        sl = "stash list";
        spp = "stash pop";
        lg1 = "log --oneline --graph --pretty='%Cgreen%h%Creset %s (%an) @ %aI'";
        fp = "fetch -p";
        merc = "merge --no-ff";
        mcont = "merge --continue";
        rh = "reset --hard";
      };
    };
  };
}
