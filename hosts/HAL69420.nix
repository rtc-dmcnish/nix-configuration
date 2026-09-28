{config,...}:
{

  system.primaryUser = "dmcnish";           # required for user-scoped options (defaults, homebrew)
  users.users."dmcnish".home = "/Users/dmcnish";   # home-manager needs this

  imports = [
    ../platforms/darwin.nix
  ];

}
