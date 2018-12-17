#!/usr/bin/perl

my $base = "$ENV{'HOME'}/.vim/bundle";

mkdir $base if ! -d $base;

$git_bundles = [
    'http://github.com/msanders/snipmate.vim',
    'http://github.com/scrooloose/nerdtree',
    'http://github.com/tpope/vim-surround',
    'http://github.com/vim-scripts/taglist.vim',
    'http://github.com/godlygeek/tabular',
    'http://github.com/Lokaltog/vim-powerline',
    'http://github.com/kien/ctrlp.vim',
    'http://github.com/c9s/perlomni.vim',
    'http://github.com/tpope/vim-fugitive',
#    'http://github.com/kakkyz81/evervim.git',
];

for my $x (@$git_bundles) {
    my $plugin; 
    # extract name
    $plugin = $1 if $x =~ m@.*/(.*)@;

    # if it doesn't exist, clone it
    if (! -d "$base/$plugin") {
        print "$plugin: cloning new copy...\n";
        system("cd $base && git clone $x");
    } else {
        # if it does exist, update it
        print "$plugin: Updating existing copy...\n";
        system("cd $base/$plugin && git pull");
    }
    
}
