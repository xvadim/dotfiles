# https://spaceship-prompt.sh/config/prompt/#Prompt-order
#
#
#SPACESHIP_PROMPT_ORDER=(
spaceship remove  time           # Time stamps section
spaceship remove   user           # Username section
# dir            # Current directory section
spaceship remove   host           # Hostname section
# git            # Git section (git_branch + git_status)
spaceship remove  hg             # Mercurial section (hg_branch  + hg_status)
# package        # Package version
spaceship remove  node           # Node.js section
spaceship remove  bun            # Bun section
spaceship remove  deno           # Deno section
spaceship remove  ruby           # Ruby section
# python         # Python section
spaceship remove  elm            # Elm section
spaceship remove  elixir         # Elixir section
spaceship remove  xcode          # Xcode section
spaceship remove  swift          # Swift section
spaceship remove  golang         # Go section
spaceship remove  perl           # Perl section
spaceship remove  php            # PHP section
spaceship remove  rust           # Rust section
spaceship remove  haskell        # Haskell Stack section
spaceship remove  scala          # Scala section
# kotlin         # Kotlin section
# java           # Java section
# lua            # Lua section
# dart           # Dart section
spaceship remove  julia          # Julia section
spaceship remove  crystal        # Crystal section
spaceship remove  docker         # Docker section
spaceship remove  docker_compose # Docker section
spaceship remove  aws            # Amazon Web Services section
spaceship remove  gcloud         # Google Cloud Platform section
spaceship remove  azure          # Azure section
# venv           # virtualenv section
spaceship remove  conda          # conda virtualenv section
spaceship remove  dotnet         # .NET section
spaceship remove  ocaml          # OCaml section
spaceship remove  vlang          # V section
spaceship remove  zig            # Zig section
spaceship remove  purescript     # PureScript section
spaceship remove  erlang         # Erlang section
spaceship remove  gleam          # Gleam section
spaceship remove  kubectl        # Kubectl context section
spaceship remove  ansible        # Ansible section
spaceship remove  terraform      # Terraform workspace section
spaceship remove  pulumi         # Pulumi stack section
spaceship remove  ibmcloud       # IBM Cloud section
spaceship remove  nix_shell      # Nix shell
spaceship remove  gnu_screen     # GNU Screen section
# exec_time      # Execution time
# async          # Async jobs indicator
# line_sep       # Line break
# battery        # Battery level and status
spaceship remove  jobs           # Background jobs indicator
# exit_code      # Exit code section
# sudo           # Sudo indicator
# char           # Prompt character
#)
#

spaceship add --after dart flutter

# Directory section
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0

# Flutter section
SPACESHIP_FLUTTER_CHANNEL_SHOW=false

# Python
SPACESHIP_PYTHON_SHOW=always
