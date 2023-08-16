let
  systems = {
    home = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJrWBRwwSrSQKeGeVZO46qa6ztA52TasRABiBNqvfgLZ root@home";
    sync = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGER+WekSnVADCVaoucHsBjP+2fiX4OHs0onvdJQFIdb root@sync";
  };
  users = {
    richard = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHPBj2LARlTzFKHC0EohVEwQ+OctYSZkNGVwWdyhPOOWS/Ie9D/g5jZP9iym1SOVh4M/JHtpldeUIOJ2wcLvJkDC/Ijef4HYicBF86UGkWDLo+liYbKNRG+dOfncM4q51FuNjNz9j7W0tYxYBvVlkgB2+6G/Gp/ys9TMlcOvI22ChTetSRcmZ95KZdTDXoMe4NiyqddJE0GDNExPgvxbaNe7J2vmrh/heTlufFzu0W1PmTuMDNEq4whJ/DQEJbYOvXjK5qxlbu8Rl/j+zKJoj0bg9LPSAxloBEJ7VaGkmH2YxMHB7dijRNkuR28i8MvBFV4L6Jxi5PBVPk7yjuySD5 slim@hastromil-2013-06-11";
  };
  allUsers = builtins.attrValues users;
  allSystems = builtins.attrValues systems;
in
{
  "user_richard.age".publicKeys = allUsers ++ allSystems;
  "sync_smb.age".publicKeys = allUsers ++ [ systems.sync ];
}
