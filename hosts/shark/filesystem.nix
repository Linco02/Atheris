{
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/9a87ed7c-672a-4f36-8f7b-70807fffbe73";
    fsType = "btrfs";
    options = [ 
      "compress=zstd:3" 
      "autodefrag" 
      "noatime" 
      "nofail"
      "x-gvfs-show"
    ];
  };
}