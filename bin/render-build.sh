#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# install bun
curl -fsSL https://bun.sh/install | bash
echo 'export BUN_INSTALL="$HOME/.bun"' >> ~/.bashrc
echo 'export PATH=$BUN_INSTALL/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

bundle exec rails assets:precompile
bundle exec rails assets:clean

bundle exec rails db:migrate