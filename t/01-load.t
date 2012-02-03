use Test::More tests => 1;

use strict;
use warnings;

BEGIN {
    use_ok('Acme::Pandora');   
}

# Now, we could go on to test the module, but since it makes
# evil things happen, the whole concept of testing it seems to be
# in appropriate, so we stop here, with a diagnostic. 

diag("You really don't want to open Acme::Pandora, trust us on this");

1;