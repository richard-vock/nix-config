{ inputs, ... }: {
    imports = [
        inputs.impermanence.nixosModules.home-manager.impermanence
    ];

    home.persistence."/persist/home/richard" = {
        directories = [
            "nix-config"
	    ".ssh"
        ];
        files = [
            ".bash_history"
        ];
        allowOther = true;
    };
}
