{ config, pkgs, ...}:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";

  services.openssh.enable = true;

  users.extraUsers.np = {
    isNormalUser = true;
    uid = 1042;
    group = "np";
    description = "Nicolas Pouillard";
    #shell = "${zsh}/bin/zsh";
    extraGroups = []; # ["wheel"]; ???
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSJdRdYhypZuVETziQagXQ5ikOHDU9lNZdwtejexcWUVsRnIV6mPh1ujygEZ7ZaOgKZ9M4Wmv9sgbSiwBW4LPtZTZvyMLrr3acwhT2NzI7DAHpA13Zyr/L53R5m+9XOqVDOBWhfvgOudDXbRVOETezWAtYnLAC/U7NI7FWJoBwwqyFrsvxGKes4LCdcX45Kwl72fK1H7NMLNDfdOyHAsERwfHaEhkcuDYJKExReKW8ISG6+Fsa51zH7NEuwykbaumi6R09TjDXLeoOUn1hIbE3MQ/zIBchq21DmuP97QEc/RZpqJUg8qj/YNg1NnWtaZ6D+zY/TE9dfjUhX/ox473D MonkeySphere2012-09-04T13:29:39 Nicolas Pouillard <np@nicolaspouillard.fr>"
    ];
  };
  users.extraGroups.np.gid = 1042;

  system.stateVersion = "15.09";
}
