
# What is this?

### It's a centralized place where I can keep my efforts to explore alternatives to traditional containerization for MusicCPR development.

### *Why are/were alternatives necessary?*

On some students' machines codespaces/docker containerization was unacceptably slow.
With technologies like Nix becoming more commonplace I figured this little side quest could act as a great excuse for me to familiarize myself with __not only Nix, but a myriad other tools__, namely:

1. Ansible
1. `archiso` (& setting up custom local repos for packages not from std arch repos)
1. Reproducible Nix system images
1. Git submodules :( (I was spurned from forking a promising repo for thesis bc of submodule confusion)
1. Migrating existing repositories to become submodules
1. Docker in general (I've had to spinup my fair share, but never configure)
1. Ad hoc scripts to try to ensure {device,shell,language,architecture,etc} agnosticism
1. More practice with bash techniques I do not use as often
1. `github-cli` package (so I can figure out if my goal to make a PR for prof riley on scrumboard to hook team repos is feasible)
1. VSCode codespaces (again, have had to use, but I have not had to configure my own)
1. General linux sysadmin (I have been considering exploring HPC sysadmin stuff for career things)
1. More I'm forgetting

I'm not sure of the status of Dr. Stewart's codespaces investigation, so this all may be moot, but again, it's to get better with these tools and to feel more comfortable configuring and maintaining environments, esp. when remote as most of my dev is now done over ssh.

### The (current) alternatives explored here

1. `MuNixAnsible`
    - Ansible is the defacto standard for automation, provisioning, etc., and I need to get better at it.
1. `MuNixArchiso`
    - lightweight custom arch linux iso meant to be run by student in VM.
1. `MuNixFlakeContainer`
    - offers additional isolation when compared to pure nix approaches
    - uses `nix-devcontainer`, which in turn makes use of a bare debian image, assumedly lighter-weight than the image used for codespaces expl, but need to confirm.
    - allows spinup & development in a VSCode codespace 
1. `MuNixPureFlake`
    - Pure nix approach with flakes is potentially most lightweight while still highly reproducible
1. `MuNixPureShell`
    - For a very fast ad hoc dev environment without too much anxiety about host machine
1. `MuNixSystem`
    - This approach is the oddest, but one I am most excited for, if it is given the go ahead and students take up the offer. It entails configuring a system and making said system available for students to create user accounts and do MusicCPR development remotely.
    - This is to give me actual hands on practice administering/setting up:
        1. a box with actual users
        1. ephemeral storage
        1. Resource monitoring and allocation

See Sub Module README's for further elaboration, as well as for some of my notes during dev

