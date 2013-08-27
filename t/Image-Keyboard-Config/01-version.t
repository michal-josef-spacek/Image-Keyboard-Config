# Pragmas.
use strict;
use warnings;

# Modules.
use Image::Keyboard::Config;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Image::Keyboard::Config::VERSION, 0.02, 'Version.');
