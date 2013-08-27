# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl class for image keyboard configuration creating.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Image-Keyboard-Config';
requires 'Class::Utils' => 0.03;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Image-Keyboard-Config';
resources 'homepage' => 'https://github.com/tupinek/Image-Keyboard-Config';
resources 'repository' => 'git://github.com/tupinek/Image-Keyboard-Config';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.02';

# Run.
WriteAll();
