# set up GPG on the system config, rather than global
# this keeps the GPG stuff out of the repo, and lets
# you change it per-machine without messing stuff up

# 1. generate GPG key: https://help.github.com/en/articles/generating-a-new-gpg-key
# 2. tell git about GPG key: https://help.github.com/en/articles/telling-git-about-your-signing-key
# 3. add GPG key to github: https://help.github.com/en/articles/adding-a-new-gpg-key-to-your-github-account

#########################

# brew install gnupg
# gpg --full-generate-key # max key size 4096
# gpg --list-secret-keys --keyid-format LONG
# # key is after / on the `sec` line
# gpg --armor --export $KEYID
# # copy/paste to github
# git config --system credential.helper osxkeychain
# git config --system user.signingKey $KEYID
# git config --system commit.gpgSign true

