# Nushell Config File
#
# version = "0.104.1"

source ~/.config/nushell/theme.nu

$env.config.buffer_editor = 'nvim'

$env.config.shell_integration.osc133 = false

$env.config.show_banner = false

$env.PATH = ($env.PATH | prepend ($env.HOME | path join ".local" "bin"))

$env.APPTAINER_CACHEDIR = '/home/yuhanjin/.apptainer/cache/'

mkdir ($env.HOME | path join "temp")

$env.SINGULARITY_TMPDIR = '/home/yuhanjin/temp'

$env.APPTAINER_TMPDIR = '/home/yuhanjin/temp'

$env.TOPIARY_CONFIG_FILE = ($env.HOME | path join .config topiary languages.ncl)

$env.TOPIARY_LANGUAGE_DIR = ($env.HOME | path join .config topiary languages)

alias ll = ls -la

def alist-prod [subcommand: string ...args: string] {
  sudo -u yuhanjin alist $subcommand ...$args --data /opt/alist/data
}

alias ty2local = rsync -arvm --delete --include="*/" --include="*.py" --include="*.log" --include="*.sh" --exclude="*" tycluster:/work/home/yuhanjin/usr/ ~/cluster/

alias wz2local = rsync -arvm --delete --include="*/" --include="*.py" --include="*.log" --include="*.sh" --exclude="*" wzcluster:/work/home/yuhanjin/usr/ ~/cluster/

alias hf2local = rsync -arvm --delete --include="*/" --include="*.py" --include="*.log" --include="*.sh" --exclude="*" hfcluster:/public/home/yuhanjin/usr/ ~/cluster/

def local2cluster [] {

  print "sync to HF cluster"

  rsync -arvm --delete --include="*/" --include=".keep" --exclude="log_dir/*" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ hfcluster:/public/home/yuhanjin/usr/

  print "sync to TY cluster"

  rsync -arvm --delete --include="*/" --include=".keep" --exclude="log_dir/*" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ tycluster:/work/home/yuhanjin/usr/

  print "sync to WZ cluster"

  rsync -arvm --delete --include="*/" --include=".keep" --exclude="log_dir/*" --include="*.py" --include="*.sh" --exclude="*" ~/cluster/ wzcluster:/work/home/yuhanjin/usr/
}

alias git_update = nu ~/scripts/git_update/git_update.nu 

alias sync_files = nu ~/scripts/sync_file/sync_files.nu

alias clst2win = nu ~/scripts/sync_file/cluster2windows.nu

alias clean_files = nu ~/scripts/clean_file/clean_files.nu

alias bd_pic_envs = nu ~/scripts/build_singularity_image/bd_pic_envs.nu

alias bd_pic_images = nu ~/scripts/build_singularity_image/bd_pic_images.nu

alias test_pic_images = nu ~/scripts/build_singularity_image/test_pic_images.nu 

alias tsf_clst_key = nu ~/scripts/transfer_cluster_key/tsf_clst_key.nu

alias backup_archlinux = bash ~/scripts/backup_archlinux/backup.sh

alias update_archlinux = bash ~/scripts/update_archlinux/update.sh

alias asr_mt = nu ~/scripts/asr_mt_scripts/asr_mt.nu

def test_fatido [] {

  cd ~/Code_Program/test/

  sudo singularity run ~/Code_Program/smilei_fatido/smilei_fatido_compiled.sif smilei ./input.py

  sudo singularity run ~/Code_Program/fatido/fatido mpirun -n 4 ./input_fatido.py
}

def test_smilei [] {

  cd ~/Code_Program/test/

  sudo singularity run ~/Code_Program/smilei_fatido/smilei_fatido ./input.py e> err.log
}

def test_warpx [] {

  cd ~/Code_Program/test/

  sudo singularity run ~/Code_Program/warpx_3d/warpx_3d ./input_warpx
}

def tonushell [] {

  cd ~/.config/nushell

  nvim
}

def tonvim [] {

  cd ~/.config/nvim

  nvim
}

def push2github [] {

  cd ~/dot_files/

  git push

  cd ~/scripts/

  git push

  cd ~/singularity_def_files/

  git push

  cd ~/Code_Program/smilei_fatido/Smilei_FaTiDo/

  git push
}

def yayup [] {

  yay -Syu --noconfirm --verbose
}

cd /home/yuhanjin
