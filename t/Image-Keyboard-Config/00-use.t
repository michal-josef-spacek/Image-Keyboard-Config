# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Image::Keyboard::Config');
}

# Test.
require_ok('Image::Keyboard::Config');
