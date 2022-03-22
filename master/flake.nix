{
  description = ''statsd client'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-statsd_client-master.flake = false;
  inputs.src-statsd_client-master.owner = "FedericoCeratto";
  inputs.src-statsd_client-master.ref   = "master";
  inputs.src-statsd_client-master.repo  = "nim-statsd-client";
  inputs.src-statsd_client-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-statsd_client-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-statsd_client-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}