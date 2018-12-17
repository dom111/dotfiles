package main;

use FindBin;                 # locate this script
use lib "$FindBin::Bin";  # use the parent directory

use DiffHighlight;

# Some scripts may not realize that SIGPIPE is being ignored when launching the
# pager--for instance scripts written in Python.
$SIG{PIPE} = 'DEFAULT';

DiffHighlight::highlight_stdin();
exit 0;
