# Nushell Config File
#
# version = "0.114.1"

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

# Real-only cluster shortcuts with delete semantics.
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

alias update_git = nu ~/scripts/update/update_git.nu

alias sync_files = nu ~/scripts/sync/sync_files.nu

alias clst2win = nu ~/scripts/sync/cluster2windows.nu

alias win2clst = nu ~/scripts/sync/windows2cluster.nu

alias clean_files = nu ~/scripts/clean/clean_files.nu

alias bd_pic_envs = nu ~/scripts/build_containers/pic/bd_pic_envs.nu

alias bd_pic_images = nu ~/scripts/build_containers/pic/bd_pic_images.nu

alias test_pic_images = nu ~/scripts/build_containers/pic/test_pic_images.nu

alias bd_post_process_images = nu ~/scripts/build_containers/post_process/bd_post_process_images.nu

alias tsf_clst_key = nu ~/scripts/transfer/tsf_clst_key.nu

alias backup_archlinux = bash ~/scripts/backup/archlinux/backup.sh

alias restore_archlinux = sudo bash ~/scripts/backup/archlinux/restore.sh

alias update_archlinux = bash ~/scripts/update/update_archlinux.sh

alias asr_mt = nu ~/scripts/process/asr_mt.nu

alias run_smilei = bash ~/scripts/run/run_pic.sh smilei

alias run_smilei_spin = bash ~/scripts/run/run_pic.sh smilei_spin

alias run_epoch_1d = bash ~/scripts/run/run_pic.sh epoch1d

alias run_epoch_2d = bash ~/scripts/run/run_pic.sh epoch2d

alias run_epoch_3d = bash ~/scripts/run/run_pic.sh epoch3d

alias run_jupyter = bash ~/scripts/run/run_jupyter.sh

alias update_iwan = bash ~/scripts/update/update_iwan_routes.sh

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
}

def yayup [] {

  # Real update without preview or confirmation.
  yay -Syu --noconfirm --verbose
}

cd /home/yuhanjin
