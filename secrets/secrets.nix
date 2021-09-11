let
  mbprtpmnr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO87WnrZNztW30J0TlnVsGxByBIqC1iqxv2yxb0JwGUq";
  users = [ mbprtpmnr ];

  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO87WnrZNztW30J0TlnVsGxByBIqC1iqxv2yxb0JwGUq";
  systems = [ nixos ];
in {
  "vaultwarden.age".publicKeys = users ++ systems;
}
